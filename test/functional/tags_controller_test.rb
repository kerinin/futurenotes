require File.dirname(__FILE__) + "/../test_helper"

class TagsControllerTest < ActionController::TestCase
  setup do
    @current_user = User.create!(
        :login => 'username',
        :password => 'password123',
        :password_confirmation => 'password123',
        :email => "username@example.com"
    )
    @other_user = User.create!(
        :login => 'username2',
        :password => 'password123',
        :password_confirmation => 'password123',
        :email => "username2@example.com"
    )    
    
    @tags = Tag.create!([
      { :name => 'Tag 1'},
      { :name => 'Tag 2'},
      { :name => 'Tag 3'},
      { :name => 'tag 1'},
      { :name => 'tag 5 foobar'}
    ])

    @notes = Note.create!([
      # search matches from title
      {:title => 'Note 1 foobar', :description => 'Description 1', :tags => [@tags[0], @tags[1]], :user => @current_user },
      # search doesn't match
      {:title => 'Note 2', :description => 'Description 2', :tags => [@tags[1], @tags[2]], :user => @current_user },
      # search matches from description
      {:title => 'Note 3', :description => 'Description 3 foobar', :user => @current_user },
      # search matches from tag
      {:title => 'Note 4', :description => 'Description 4', :tags => [@tags[4],@tags[3],@tags[2]], :user => @current_user }
    ])
    
    @private_notes = Note.create!([
      {:title => 'Private Note 1 foobar', :description => 'Private Description 1', :tags => [@tags[0], @tags[1]], :private => true, :user => @current_user },
      {:title => 'Private Note 2', :description => 'Private Description 2', :tags => [@tags[1], @tags[2]], :private => true, :user => @current_user },
      {:title => 'Private Note 3', :description => 'Private Description 3 foobar', :private => true, :user => @current_user},
      {:title => 'Private Note 4', :description => 'Private Description 4', :tags => [@tags[4],@tags[3],@tags[2]], :private => true, :user => @current_user }  
    ])
    
    @tag = @tags[0]
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag" do
    assert_difference('Tag.count') do
      post :create, :tag => @tag.attributes
    end

    assert_redirected_to tag_path(assigns(:tag))
  end

  test "should show tag" do
    get :show, :id => @tag.to_param
    assert_response :success

    assert assigns(:public_notes).include?( @notes[0] )
    assert !assigns(:public_notes).include?( @notes[1] )
    assert !assigns(:public_notes).include?( @notes[2] )
    assert assigns(:public_notes).include?( @notes[3] )
    assert !assigns(:public_notes).include?( @private_notes[0] )
    assert !assigns(:public_notes).include?( @private_notes[1] )
    assert !assigns(:public_notes).include?( @private_notes[2] )
    assert !assigns(:public_notes).include?( @private_notes[3] )
    
    assert assigns(:user_notes).empty?
  end
  
  test "should show notes with tags with different capitalization" do
    get :show, :id => @tags[3].to_param
    assert_response :success
    
    assert assigns(:public_notes).include?( @notes[0] )
    assert !assigns(:public_notes).include?( @notes[1] )
    assert !assigns(:public_notes).include?( @notes[2] )
    assert assigns(:public_notes).include?( @notes[3] )
    assert !assigns(:public_notes).include?( @private_notes[0] )
    assert !assigns(:public_notes).include?( @private_notes[1] )
    assert !assigns(:public_notes).include?( @private_notes[2] )
    assert !assigns(:public_notes).include?( @private_notes[3] )
    
    assert assigns(:user_notes).empty?
  end
        
  test "should show tag when logged in" do
    sign_in @current_user
    
    get :show, :id => @tag.to_param
    assert_response :success
    
    assert assigns(:public_notes).empty?
    
    assert assigns(:user_notes).include?( @notes[0] )
    assert !assigns(:user_notes).include?( @notes[1] )
    assert !assigns(:user_notes).include?( @notes[2] )
    assert assigns(:user_notes).include?( @notes[3] )
    assert assigns(:user_notes).include?( @private_notes[0] )
    assert !assigns(:user_notes).include?( @private_notes[1] )
    assert !assigns(:user_notes).include?( @private_notes[2] )
    assert assigns(:user_notes).include?( @private_notes[3] )
  end

  test "should show tag when logged in as another user" do
    sign_in @other_user
    
    get :show, :id => @tag.to_param
    assert_response :success
    
    assert assigns(:public_notes).include?( @notes[0] )
    assert !assigns(:public_notes).include?( @notes[1] )
    assert !assigns(:public_notes).include?( @notes[2] )
    assert assigns(:public_notes).include?( @notes[3] )
    assert !assigns(:public_notes).include?( @private_notes[0] )
    assert !assigns(:public_notes).include?( @private_notes[1] )
    assert !assigns(:public_notes).include?( @private_notes[2] )
    assert !assigns(:public_notes).include?( @private_notes[3] )
    
    assert assigns(:user_notes).empty?
  end
    
  test "should get edit" do
    get :edit, :id => @tag.to_param
    assert_response :success
  end

  test "should update tag" do
    put :update, :id => @tag.to_param, :tag => @tag.attributes
    assert_redirected_to tag_path(assigns(:tag))
  end

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete :destroy, :id => @tag.to_param
    end

    assert_redirected_to tags_path
  end
end

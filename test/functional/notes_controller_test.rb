require File.dirname(__FILE__) + "/../test_helper"

class NotesControllerTest < ActionController::TestCase
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
    
    @note = @notes[0]
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create note" do
    sign_in @current_user
    
    assert_difference('Note.count') do
      post :create, :note => @note.attributes
    end

    assert_redirected_to user_path(@current_user)
  end

  test "should create note w/ delimited new tags" do
    sign_in @current_user
    
    assert_difference('Note.count') do
      post :create, :note => {
        :title => 'new note title',
        :description => 'new note description',
      }, :new_tag => "random tag, second random tag"
    end
    
    assert_redirected_to user_path(@current_user)
    
    assert_equal 2, assigns(:note).tags.count
    assert_equal 'random tag', assigns(:note).tags.first.name
    assert_equal 'second random tag', assigns(:note).tags.last.name
    assert_equal 1, assigns(:note).tags.first.notes.count
    assert_equal 1, assigns(:note).tags.last.notes.count
  end

  test "should add existing tags if typed in new tags field" do
    sign_in @current_user
    
    assert_difference('Note.count') do
      post :create, :note => {
        :title => 'new note title',
        :description => 'new note description',
      }, :new_tag => "Tag 1"
    end
    
    assert_redirected_to user_path(@current_user)
    
    assert_equal 1, assigns(:note).tags.count
    assert_equal @tags[0], assigns(:note).tags.first
  end

  test "should add existing tags if typed in new tags field, delimited" do
    sign_in @current_user
    
    assert_difference('Note.count') do
      post :create, :note => {
        :title => 'new note title',
        :description => 'new note description',
      }, :new_tag => "Tag 1, Tag 2"
    end
    
    assert_redirected_to user_path(@current_user)
    
    assert_equal 2, assigns(:note).tags.count
    assert_equal @tags[0], assigns(:note).tags.first
    assert_equal @tags[1], assigns(:note).tags.last
  end

  test "should add existing tags if typed in new tags field, delimited w/ arbitrary spacing" do
    sign_in @current_user
    
    assert_difference('Note.count') do
      post :create, :note => {
        :title => 'new note title',
        :description => 'new note description',
      }, :new_tag => "Tag 1, Tag 2,Tag 3,   tag 1  ,   tag 5 foobar"
    end
    
    assert_redirected_to user_path(@current_user)
    
    assert_equal 5, assigns(:note).tags.count
    assert assigns(:note).tags.include?( @tags[0] )
    assert assigns(:note).tags.include?( @tags[1] )
    assert assigns(:note).tags.include?( @tags[2] )
    assert assigns(:note).tags.include?( @tags[3] )
    assert assigns(:note).tags.include?( @tags[4] )
  end      

  test "should create new tag if capitalization different" do
    sign_in @current_user
    
    assert_difference('Note.count') do
      post :create, :note => {
        :title => 'new note title',
        :description => 'new note description',
      }, :new_tag => "tAg 1"
    end

    assert_redirected_to user_path(@current_user)
    
    assert_equal 1, assigns(:note).tags.count
    assert_equal 'tAg 1', assigns(:note).tags.first.name
    assert_not_equal @tags[0], assigns(:note).tags.first
  end      
   
  test "adding both existing and new tags" do
    sign_in @current_user
    
    assert_difference('Note.count') do
      post :create, :note => {
        :title => 'new note title',
        :description => 'new note description',
      }, :new_tag => "Tag 1, Another tag"
    end

    assert_redirected_to user_path(@current_user)
    
    assert_equal 2, assigns(:note).tags.count
    assert_equal @tags[0], assigns(:note).tags.first
    assert_equal 'Another tag', assigns(:note).tags.last.name
  end
     
  test "should show note" do
    get :show, :id => @note.to_param
    assert_response :success
  end

  test "should get edit" do
    sign_in @current_user
    
    get :edit, :id => @note.to_param
    assert_response :success
  end

  test "should update note" do
    sign_in @current_user
    
    put :update, :id => @note.to_param, :note => @note.attributes
    assert_redirected_to user_path(@current_user)
  end

  test "should destroy note" do
    sign_in @current_user
    
    assert_difference('Note.count', -1) do
      delete :destroy, :id => @note.to_param
    end

    assert_redirected_to user_path(@current_user)
  end
end

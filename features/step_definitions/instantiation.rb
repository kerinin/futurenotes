Given /^a test note for the current user$/ do
  @test_note = Note.create!(:title => 'Testing 123', :description => 'Testing Description', :user => @current_user)
end

Given /^a test note for the current user with title '(.+)'$/ do |title|
  @test_note = Note.create!(:title => title, :description => 'Testing Description', :user => @current_user)
end

Given /^a test tag$/ do
  @test_tag = Tag.create!(:name => 'Test Tag')
end

Given /^a test tag named '(.+)'$/ do |name|
  @test_tag = Tag.create!(:name => name)
end

Given /^a test user with password '(.+)'$/ do |password|
  @test_user = User.create!(:email => 'test@example.com', :password => password, :password_confirmation => password)
end
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
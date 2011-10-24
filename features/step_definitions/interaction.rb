Given 'I have authenticated from /$path' do |path|
  @current_user = User.create!(
      :login => 'username',
      :password => 'password',
      :password_confirmation => 'password',
      :email => "username@example.com"
  )
  
  visit path
  
  fill_in 'Login', :with => 'username@example.com'
  fill_in 'Password', :with => 'password'
  click_button('Go')
end

When "I click '$path' from within '$scope'" do |path, scope|
  within(scope) do
    click_link path
  end
end

When "I click '$path'" do |path|
  click_link path
end

When "I press the button '$selector'" do |selector|
  click_button selector
end

When "I type '$text' into '$field'" do |text, field|
  fill_in field, :with => text
end

When "I login as valid user '$username'" do |username|
  @current_user = User.create!(
      :login => username,
      :password => 'password123',
      :password_confirmation => 'password123',
      :email => "#{username}@example.com"
  )
  fill_in 'Email', :with => "#{username}@example.com"
  fill_in 'Password', :with => 'password123'
  click_button('Sign in')
end

When "I login as invalid user '$username'" do |username|
  fill_in 'Email', :with => "#{username}@example.com"
  fill_in 'Password', :with => 'password123'
  click_button('Sign in')
end

Given "I have entered a new note" do
  pending # express the regexp above with the code you wish you had
end
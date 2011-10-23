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

When "I click '$path'" do |path|
  click_link path
end

When "I press the button '$selector'" do |selector|
  click_button selector
end

When "I type '$text' into '$field'" do |text, field|
  fill_in field, :with => text
end

When 'I submit the form' do
  pending # express the regexp above with the code you wish you had
end

When 'I fill in my credentials' do
  pending
end

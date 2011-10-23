Given "I am on '$route'" do |route|
  visit route
end

When "I load '/$page'" do |page|
  visit page
end

Then "I should be redirected to '$route'" do |route|
  current_path.should == route
end

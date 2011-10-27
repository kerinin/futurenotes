# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a 
# newer version of cucumber-rails. Consider adding your own code to a new file 
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

require 'rubygems'
require 'spork'
 
Spork.prefork do
  require 'cucumber/rails'


  # Capybara defaults to XPath selectors rather than Webrat's default of CSS3. In
  # order to ease the transition to Capybara we set the default here. If you'd
  # prefer to use XPath just remove this line and adjust any selectors in your
  # steps to use the XPath syntax.
  Capybara.default_selector = :css

end
 
Spork.each_run do
  # By default, any exception happening in your Rails application will bubble up
  # to Cucumber so that your scenario will fail. This is a different from how 
  # your application behaves in the production environment, where an error page will 
  # be rendered instead.
  #
  # Sometimes we want to override this default behaviour and allow Rails to rescue
  # exceptions and display an error page (just like when the app is running in production).
  # Typical scenarios where you want to do this is when you test your error pages.
  # There are two ways to allow Rails to rescue exceptions:
  #
  # 1) Tag your scenario (or feature) with @allow-rescue
  #
  # 2) Set the value below to true. Beware that doing this globally is not
  # recommended as it will mask a lot of errors for you!
  #
  ActionController::Base.allow_rescue = false
  
  # Remove/comment out the lines below if your app doesn't have a database.
  # For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
  begin
    DatabaseCleaner.strategy = :transaction
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end
  
  # You may also want to configure DatabaseCleaner to use different strategies for certain features and scenarios.
  # See the DatabaseCleaner documentation for details. Example:
  #
  #   Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
  #     DatabaseCleaner.strategy = :truncation, {:except => %w[widgets]}
  #   end
  #
  #   Before('~@no-txn', '~@selenium', '~@culerity', '~@celerity', '~@javascript') do
  #     DatabaseCleaner.strategy = :transaction
  #   end
  #
  
  Before do
    @current_user = User.create!(
        :login => 'username',
        :password => 'password123',
        :password_confirmation => 'password123',
        :email => "username@example.com"
    )
    
    tags = Tag.create([
      { :name => 'Tag 1'},
      { :name => 'Tag 2'},
      { :name => 'Tag 3 foobar'},
      { :name => 'tag 1'}
    ])

    notes = Note.create([
      {:title => 'Note 1 foobar', :description => 'Description 1', :tags => [tags[0], tags[1]], :user => @current_user },
      {:title => 'Note 2', :description => 'Description 2', :tags => [tags[1], tags[2]], :user => @current_user },
      {:title => 'Note 3', :description => 'Description 3 foobar', :user => @current_user },
      {:title => 'Note 4', :description => 'Description 4', :tags => [tags[3],tags[2]], :user => @current_user }
    ])
    
    private_notes = Note.create([
      {:title => 'Private Note 1 foobar', :description => 'Private Description 1', :tags => [tags[0], tags[1]], :private => true, :user => @current_user },
      {:title => 'Private Note 2', :description => 'Private Description 2', :tags => [tags[1], tags[2]], :private => true, :user => @current_user },
      {:title => 'Private Note 3', :description => 'Private Description 3 foobar', :private => true, :user => @current_user},
      {:title => 'Private Note 4', :description => 'Private Description 4', :tags => [tags[3],tags[2]], :private => true, :user => @current_user }  
    ])
  end
end

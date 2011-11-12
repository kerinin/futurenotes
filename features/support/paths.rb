# features/support/paths.rb
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
      
    when 'the search results page'
      '/search'
    when 'the new note page'
      '/notes/new'
    when 'the notes page'
      '/notes'
    when 'the terms of service'
      '/tos'
    when 'the about page'
      '/about'
    when 'the sign-in page'
      '/users/sign_in'
      
    when 'the new user page'
      new_user_registration_path
    when 'the test note edit page'
      edit_note_path(@test_note)

    when 'the test tag page'
      tag_path(@test_tag)
    when 'the test user home page'
      user_path(@test_user)
      
    when /^tag page (\d+)$/
      tag_path( @tags[$1.to_i-1] )
    when /^user page (\d+)$/
      user_path($1)
    when /^note page (\d+)$/
      note_path( @notes[$1.to_i-1] )
    when /^the user home page$/
      user_path( @current_user )
    when /^edit note (\d+)$/
      edit_note_path( @notes[$1.to_i-1] )

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
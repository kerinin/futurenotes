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
    when /^tag page (\d+)$/
      tag_path($1)
    when /^user page (\d+)$/
      user_path($1)
    when /^note page (\d+)$/
      note_path($1)

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
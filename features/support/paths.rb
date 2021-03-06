module NavigationHelpers
    # Maps a name to a path. Used by the
    #
    #   When /^I go to (.+)$/ do |page_name|
    #
    # step definition in web_steps.rb
    #
    def path_to(page_name)
      case page_name
  
      when /the project11 homepage/
        '/projects/11'
        
      
      when /the home\s?page/
        '/'
  
      when /the sign up page/
        '/users/sign_up'
  
      # Add more mappings here.
      # Here is an example that pulls values out of the Regexp:
      #
      #   when /^(.*)'s profile page$/i
      #     user_profile_path(User.find_by_login($1))
        
      when /^the Group1 homepage$/
        '/groups/1'

      when /^the details page for “project1”$/
        '/projects/1/edit'

      when /^the project1 homepage$/
        '/projects/1'

      when /^the new Project page$/
        '/projects/new'

      when /^the projects3 detail page$/
        '/projects/3'
      
  
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
module NavigationHelpers
    # Maps a name to a path. Used by the
    #
    #   When /^I go to (.+)$/ do |page_name|
    #
    # step definition in web_steps.rb
    #
    def path_to(page_name)
      if page_name =~ /the ([^"]+) page for "([^"]+)"/
        page = $1.to_s
        group = $2.to_s
      end
      case page_name
  
      when /the project11 homepage/
        '/projects/11'

      when /the group10 homepage/
        '/groups/10'

      when /^the profile1 homepage$/
        '/users/1'
      when /^the user1 homepage$/
        '/users/1'
        
      when /the home\s?page/
        '/'
  
      when /the sign up page/
        '/users/sign_up'
  
      when /the sign in page/
        '/users/sign_in'

      when /the Group1 homepage/
        '/groups/1'

      when /the home\s?page/
        '/'

      when /the group sign up page/
        '/groups/sign_up'
      when /^the show page for "(.*)"/ then
        group_path(Group.find_by(name: group))
      when /^the "Edit" page for "(.*)"/ then
        edit_group_path(Group.find_by_title(group))  

      # Add more mappings here.
      # Here is an example that pulls values out of the Regexp:
      #
      #   when /^(.*)'s user page$/i
      #     user_user_path(User.find_by_login($1))
        
      when /^the group1 homepage$/
        '/groups/1'

      when /^the details page for “project1”$/
        '/projects/1/edit'

      when /^the project1 homepage$/
        '/projects/1'

      when /^the new Project page$/
        '/projects/new'

      when /^the projects3 detail page$/
        '/projects/3'

      when /^the join page for "Bio Group"$/
        'groups/1'
      
  
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
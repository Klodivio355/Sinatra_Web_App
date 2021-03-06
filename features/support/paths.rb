module NavigationHelpers
    def path_to(page_name)
        case page_name
            when /the home\s?page/
                '/home'
            when /the\s?log\s?in\s?page/
                '/login'
            when /the\s?log\s?in1\s?page/
                '/' 
            when /the\s?register\s?page/
                '/create_account'
            when /the reacted\s?register\s?page/
                '/makeaccount'
            when /the\s?contact\s?page/
                '/contact'
            when /the\s?admin\s?page/
                '/admin_section'
            when /the\s?admin_two\s?page/
                '/admin_two'
            else
                raise "Can't find mapping"
        end
    end
    
end

World(NavigationHelpers)
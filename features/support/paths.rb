module NavigationHelpers
    def path_to(page_name)
        case page_name
            when /the home\s?page/
                '/home'
            when /the\s?log\s?in\s?page/
                '/login'            
            else
                raise "Can't find mapping"
        end
    end
    
end

World(NavigationHelpers)
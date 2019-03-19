module NavigationHelpers
    def path_to(page_name)
        case page_name
            when /the home\s?page/
                '/'
            when /the real\s?home\s?page/
                '/home'            
            else
                raise "Can't find mapping"
        end
    end
    
end

World(NavigationHelpers)
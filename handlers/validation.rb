$LOAD_PATH << '.'
require 'constants/constants.rb'

class Validation

    def get_player_name

        puts "Enter your name"
          i = 1
          name = ""
          constants = Constants.new
          loop do
              name = gets.chomp
              is_valid = validate_name(name)
              if (is_valid)
                  break
              end
              i+=1
              if (i > 3)
                puts "you have provided invalid input 3 times "
                exit 
               end  
                
                constants.enter_valid_name
            end
          
          return name 
      end
      
    def validate_name(name)
        is_valid = false
        if (name == nil || name.length == 0)
            return is_valid
        end
        name.each_char do |char|
            #only alphabets are considered valid in name
            is_valid = ((char.ord >= 97 && char.ord <= 122) || (char.ord >= 65 && char.ord <= 90) )#char.ord == 32)
            break if !is_valid
        end
        
        return is_valid
    end
end

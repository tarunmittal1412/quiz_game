$LOAD_PATH << '.'
require 'csv'
require 'handlers/scores.rb'
require 'constants/constants.rb'
require 'entities/quiz_questions.rb'

class AdminHandler

    def login_admin_user
        puts "Enter Admin user name " 
        i = 1
        loop do 
        user_name = gets.chomp.to_s
        puts "Enter Admin password" 
        password = gets.chomp.to_s

            if (user_name == "a" && password == "1")
                puts "Login Successfully"
                open_admin_panel
                return true 
            else  
                i+=1
            end
            if i > 3
                puts "you have provided invalid input 3 times "
                exit 
            end
        end
        return false
    end

    def open_admin_panel
        constants = Constants.new
        constants.admin_panel
        admin_input = gets.chomp.to_i
        case admin_input

            when 1
              upload_quiz_data
              
    
            when 2
              score = Scores.new
              score.get_scores(100)
              

            when 3
              menu = QuizMenu.new
              puts "Logout succefully .............."
              menu.open_main_menu
              return
              
        end 
             open_admin_panel
    end

    def upload_quiz_data
        user_input = QuizQuestions.new(nil,nil,nil)

        puts "Enter quiz question"
        a = gets.chomp.to_s
      
        for i in 1..3 do 
          if (i > 2)
            open_admin_panel 
          end 
          if (a.nil? || a.empty?)
            puts "enter valid question"
            a = gets.chomp.to_s
          else 
            user_input.question = a
            break
          end
        end
        
        
        puts "Enter quiz category"
        b = gets.chomp.to_s
        for i in 1..3 do 
          if (i > 2)
            open_admin_panel
          end 
          if (b.nil? || b.empty?)
            puts "enter valid category"
            b = gets.chomp.to_s
          else 
            user_input.category = b
            break
          end
        end
       
            
        category_map = Hash.new
        CSV.foreach('csv_files/quiz_categories.csv') do |row|
            category_map[row[0].downcase] = row[1]
        end
        if (!category_map.key?(b.downcase))
            CSV.open("csv_files/quiz_categories.csv", "a+") do |csv|
                csv << [b, category_map.size+1]
            end
        end
        
        puts "Enter quiz answer"
        c = gets.chomp.to_s
        for i in 1..3 do 
          if (i > 2)
            open_admin_panel
          end 
          if (c.nil? || c.empty?)
            puts "enter valid answer"
            c = gets.chomp.to_s
          else 
            user_input.answer = c
            break
          end
        end
        

       

        CSV.open("csv_files/quiz_details.csv", "a+") do |csv|
            csv << [user_input.category,user_input.question,user_input.answer]
        end
    end

end
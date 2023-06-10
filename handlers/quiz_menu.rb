$LOAD_PATH << '.'
require 'constants/constants.rb'
require 'handlers/admin_handler.rb'
require 'handlers/quiz.rb'
require 'handlers/scores.rb'
require 'handlers/validation.rb'

class QuizMenu
    def open_main_menu 
        constants = Constants.new
        constants.menu
        choice = gets.chomp.to_i

        case choice
            when 1
                validate = Validation.new
                name = validate.get_player_name
                
                quiz = Quiz.new
                category = quiz.select_quiz
                player = Player.new(name,nil)
                quiz.start_quiz(category,player)

                constants.quiz_end(name)
                open_main_menu
            when 2
                score = Scores.new
                score.get_scores(3)
                open_main_menu
              
            when 3 
                admin = AdminHandler.new
                admin.login_admin_user
                constants.admin_panel
            when 4 
                constants.exiting
                exit
            else 
                constants.valid_input
                open_main_menu
        end
    end
end    
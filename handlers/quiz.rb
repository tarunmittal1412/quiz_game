$LOAD_PATH << '.'
require 'constants/constants.rb'
require 'handlers/scores.rb'
require 'timeout'
require 'entities/player.rb'
require 'entities/quiz_questions.rb'


class Quiz

    def select_quiz
      puts "\nSelect Quiz Category" 

      i = 0
      category_map = Hash.new
      CSV.foreach('csv_files/quiz_categories.csv') do |row|
        category_map[row[1]] = row[0]
        puts "#{i+=1}. #{row[0]}"
      end
      
      is_valid_category = false
      begin
          category_input = gets.chomp
          is_valid_category = category_map.key?(category_input)
          if (is_valid_category)
              break
          else
              puts "Please enter valid category"
          end
      end while (!is_valid_category)

      return category_map[category_input]
    end

    def start_quiz(category,player)
      score=0
      constants = Constants.new
      constants.instruction

      i = 0
      CSV.foreach('csv_files/quiz_details.csv') do |quiz_detail|
        quiz_question = QuizQuestions.new(quiz_detail[1],quiz_detail[2],quiz_detail[0])
        if (category.downcase != quiz_question.category.downcase)
          next
        end

        i += 1
     
        
        puts quiz_question.question.gsub("\\n", "\n")
        puts("Enter your choice: ")

        begin
          Timeout.timeout(10) do
            player_ans = gets.chomp.to_s.upcase
            if(player_ans == quiz_question.answer)
                puts"Correct ans"
                score+=1
            else
                puts "Incorrect ans"
                puts "The correct ans is option #{quiz_question.answer}"
                puts
            end
          end 
          rescue Timeout::Error
            puts "Timeout! You took too long to answer. Moving to next question.\n\n"
        end            
      end
      
      puts "Your total score is #{score} out of 5"
      player.score = score
      scores = Scores.new
      scores.save_score(player,category)
    end
  end

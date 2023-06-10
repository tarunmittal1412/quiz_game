$LOAD_PATH << '.'
require 'handlers/quiz_menu.rb'

class Main
    def main_method
      menu = QuizMenu.new
      menu.open_main_menu
    end
end

main = Main.new
main.main_method
  




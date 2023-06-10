class Constants
    def admin_panel
        puts "Welcome to Admin Panel"
        puts "1. Add a new quiz question"
        puts "2. View all players data"
        puts "3. Log out and go back to main menu"
    end

    def introduction
        puts "Enter your name"
    end

    def menu
        puts "\nWelcome to the world of Quiz!!\n "
        puts "\nMain Menu"
        puts "1. Select Quiz Category"
        puts "2. View High Scores"
        puts "3. Login as Admin"
        puts "4. Exit"
        print "Please enter your choice: "
    end

    def instruction
        puts"-----------------INSTRUCTIONS-----------------------"
        puts "Total number of questions are 5 "
        puts "Each question carry 1 marks"
        puts "No negative marking"
        puts "Attempt all questions"
    end

    def quiz_end(name)
        puts "---------------------------------------------------"
        puts "THANK YOU #{name.upcase} !!! YOUR QUIZ IS COMPLETED."
        puts "---------------------------------------------------"
    end

    def valid_input
        puts "Enter valid input"
        puts "-----------------------------------------------------"
    end

    def exiting
        puts "EXITING..."
    end

    def enter_valid_name
        puts "Please enter valid name and use only alphabets"
    end
end
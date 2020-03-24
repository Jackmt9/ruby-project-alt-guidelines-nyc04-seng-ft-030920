class Interface

    attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        puts "\nWelcome to FreeTable! 🍽"
        puts "\n---------------------\n"
    end

    def user_or_restaurant
<<<<<<< HEAD
      answer =  prompt.select("Are you a Restaurant or User?") do |menu|
=======
        answer =  prompt.select("Are you a Restaurant or User?") do |menu|
>>>>>>> master
            menu.choice "Restaurant"
            menu.choice "User"
        end
    
       
    end

<<<<<<< HEAD


    # def new_or_existing
    #     answer = user_or_restaurant
    #     prompt.select("Do you have an existing account?") do |q|
    #         q.choice 'Login', -> {answer.constantize.create_account}
            
    #     end
    # end

    def user_menu(user)
        prompt.select("") do |q|
            q.choice 'Make a Reservation', -> {Reservation.book(user)}
            q.choice 'View an Existing Reservation'
            q.choice 'Cancel a Reservation'
            q.choice 'Change a Reservation'
        end
    end

    def restaurant_menu
        prompt.select("") do |q|
            q.choice 'Check Reserved Tables'
            q.choice 'List Open Tables'
            q.choice 'Delete Listing'
            q.choice 'Change Listing'
=======
    def user_menu(user)
        prompt.select("") do |q|
            q.choice 'Make a Reservation', -> {Reservation.book(user)}
            q.choice 'View an Existing Reservation', -> {}
            q.choice 'Cancel a Reservation', -> {}
            q.choice 'Change a Reservation', -> {}
        end
    end

    def restaurant_menu(restaurant)
        prompt.select("") do |q|
            q.choice 'Check Reserved Tables', -> {}
            q.choice 'Show Open Tables', -> {restaurant.show_open}
            q.choice 'Delete Listing', -> {}
            q.choice 'Change Listing', -> {}
>>>>>>> master
        end
    end
end
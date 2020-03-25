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
        answer =  prompt.select("Are you a User or Restaurant?") do |menu|
            menu.choice "User"
            menu.choice "Restaurant"
        end
    
       
    end

    def user_menu(user)
        prompt.select("") do |q|
            q.choice 'Make a Reservation', -> {user.book}
            q.choice 'View an Existing Reservation', -> {user.find_resos}
            q.choice 'Cancel a Reservation', -> {user.cancel_reso}
            q.choice 'Change a Reservation', -> {user.change_reso}
        end
    end

    def restaurant_menu(restaurant)
        binding.pry 
        prompt.select("") do |q|
<<<<<<< HEAD
            
=======
>>>>>>> master
            q.choice 'Check Reserved Tables', -> {restaurant.reserved}
            q.choice 'Show Open Tables', -> {restaurant.show_open}
            q.choice 'Delete Listing', -> {restaurant.delete}
            q.choice 'Change Listing', -> {restaurant.change}
        end
    end
end
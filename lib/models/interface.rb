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
        answer =  prompt.select("Are you a Restaurant or User?") do |menu|
            menu.choice "Restaurant"
            menu.choice "User"
        end
    
       
    end

    def user_menu(user)
        prompt.select("") do |q|
            q.choice 'Make a Reservation', -> {Reservation.book(user)}
            q.choice 'View an Existing Reservation', -> {}
            q.choice 'Cancel a Reservation', -> {}
            q.choice 'Change a Reservation', -> {}
        end
    end

    def restaurant_menu(restaurant)
        binding.pry 
        prompt.select("") do |q|
            
            q.choice 'Check Reserved Tables', -> {restaurant.reserved}
            q.choice 'Show Open Tables', -> {restaurant.show_open}
            q.choice 'Delete Listing', -> {}
            q.choice 'Change Listing', -> {}
        end
    end
end
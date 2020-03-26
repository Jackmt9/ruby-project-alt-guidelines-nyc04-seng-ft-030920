class Interface

    attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end

    def whirly_animation
        Whirly.start do
            Whirly.status = "Lets get ready to eat"
            sleep 3
            Whirly.status = "Getting the menu"
            sleep 2
          end
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
            q.choice 'View Existing Reservations', -> {user.find_resos}
            q.choice 'Cancel a Reservation', -> {user.cancel_reso}
        end
    end

    def restaurant_menu(restaurant)
        
        prompt.select("") do |q|
            q.choice 'Check Reserved Tables', -> {restaurant.reserved}
            q.choice 'Show Open Tables', -> {restaurant.open}
            q.choice 'Cancel a Users Reservation', -> {restaurant.delete_booked_reso}
            q.choice 'Cancel an Open Reservation', -> {restaurant.delete_open_reso}
            q.choice 'Create Listing', -> {restaurant.create}
        end
    end
end
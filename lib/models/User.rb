class User < ActiveRecord::Base

    @@prompt = TTY::Prompt.new
    has_many :reservations

    def self.list_by_name
        Restaurant.all.map(&:name)
    end

    def self.log_in
        puts "\nPlease enter your full name: "
        name = gets.chomp
        if name == ""
            puts "#--------Invalid entry, please try again.---------#"
            log_in
        end
        User.find_or_create_by(name: name)
    end

    def book
        # Needs to display reservation instances properly ----------------vvv
        reservation = @@prompt.select("Where would you like to dine?", Reservation.open)
        reservation.user = self
        reservation
    end

    def find_resos
        resos = Reservation.all.where(user: self)
        if resos[0]
            puts "\nYour reservation(s):\n#{resos}"
        else
            puts "\nYou have no booked reservations."
        end
    end

    def cancel_reso
        puts "Which reservation would you like to cancel?"
        # display user resos and cancel.
    end

    def change_reso
        # Prompt user and ask for change of parameters
    end
end
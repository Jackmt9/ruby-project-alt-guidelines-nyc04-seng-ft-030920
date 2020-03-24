class Restaurant < ActiveRecord::Base

    @prompt = TTY::Prompt.new

    def self.list_by_name
        Restaurant.all.map(&:name)
    end

    def self.log_in
        @prompt.select("Please select your restaurant from the following: ", list_by_name)
    end

<<<<<<< HEAD
   
=======

    def show_open
        binding.pry
        Reservation.all.where(user_id: nil && restaurant == self)
    end

>>>>>>> master
end
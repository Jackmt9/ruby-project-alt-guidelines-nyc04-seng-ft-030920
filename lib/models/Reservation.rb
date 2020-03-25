class Reservation < ActiveRecord::Base
    belongs_to :restaurant
    belongs_to :user

    @prompt = TTY::Prompt.new

    def self.open
        Reservation.all.where(user_id: nil)
    end
<<<<<<< HEAD
    def self.book(user)
        reservation = @prompt.select("Where would you like to dine?", show_open)
        reservation.user = user
        reservation
=======

    def self.closed
        Reservation.all.where(user_id: !nil)
>>>>>>> master
    end
   
end
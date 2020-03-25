class Reservation < ActiveRecord::Base
    belongs_to :restaurant
    belongs_to :user

    @prompt = TTY::Prompt.new

    def self.show_open
        open = Reservation.all.where(user_id: nil).map do |reso|
            reso
        end
        # Need this to diplay restaurant name and table size but in reality select a Reservation instance
    end
    def self.book(user)
        reservation = @prompt.select("Where would you like to dine?", show_open)
        reservation.user = user
        reservation
    end
   
end
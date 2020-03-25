class Reservation < ActiveRecord::Base
    belongs_to :restaurant
    belongs_to :user

    @prompt = TTY::Prompt.new

    def self.open
        Reservation.all.where(user_id: nil)
    end

    def self.closed
        Reservation.all.where(user_id: !nil)
    end
   
end
class Reservation < ActiveRecord::Base

    belongs_to :restaurant

    def self.show_open
        open = Reservation.all.where(user_id: nil).map do |reso|
            reso.restaurant.name
        end
    end


end
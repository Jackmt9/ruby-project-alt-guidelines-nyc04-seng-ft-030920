class Reservation < ActiveRecord::Base
    belongs_to :restaurant
    belongs_to :user

    @prompt = TTY::Prompt.new(active_color: :blue)

    def self.open
        Reservation.all.where(user_id: nil)
    end

    def self.closed
        Reservation.all.where(user_id: (1..1000))
    end

    def self.done
        puts `clear`
        puts "\n\n\n#---------Thanks For Using FreeTable---------#".colorize(:color => :green)
        exit
    end
   
end
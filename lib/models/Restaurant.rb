class Restaurant < ActiveRecord::Base

    @prompt = TTY::Prompt.new

    def self.list_by_name
        Restaurant.all.map(&:name)
    end

    def self.log_in
        @prompt.select("Please select your restaurant from the following: ", list_by_name)
    end


    def show_open
    
        Reservation.all.where(user_id: nil && restaurant == self)
    end

    def reserved
      
        #   reserved = Reservation.all.each do |table|  
        #     #  table.user_id
    
        #     end 
           Reservation.all.where(name: !nil && restaurant == self)
        end 

    

end
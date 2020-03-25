class Restaurant < ActiveRecord::Base

    @prompt = TTY::Prompt.new

    def self.list_by_name
        Restaurant.all.map(&:name)
    end

    def self.log_in
        @prompt.select("Please select your restaurant from the following: ", list_by_name)
    # ^^^ needs to be a restaurant instance
    end

<<<<<<< HEAD

    def show_open
    
=======
    def open
>>>>>>> master
        Reservation.all.where(user_id: nil && restaurant == self)
    end

    def reserved
<<<<<<< HEAD
      
        #   reserved = Reservation.all.each do |table|  
        #     #  table.user_id
    
        #     end 
           Reservation.all.where(name: !nil && restaurant == self)
        end 

    

=======
        # Return reserved instances for a particular restaurant instance
    end

    def delete
        # Prompt restaurant with list of reservations and ask which they wish to cancel
    end

    def change
        # Prompt restaurant with change options
    end
>>>>>>> master
end
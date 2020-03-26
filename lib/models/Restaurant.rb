class Restaurant < ActiveRecord::Base
    
    @@prompt = TTY::Prompt.new
    has_many :reservations

    def self.log_in
       @@prompt.select("Please select your restaurant from the following: ") do |q|
            Restaurant.all.each do |restaurant|
               q.choice restaurant.name, -> {restaurant}
            end
        end 
    end

    def open
        resos = Reservation.where(restaurant: self, user_id: nil)
        if resos.length > 0
            puts "The following have not yet been reserved:\n\n"
            resos.each do |reso| 
                puts "#{reso.datetime} - Table of #{reso.table_size}"
            end
        else
            puts "All of your reservation listings are fully booked."
        end
    end

        resos.each do |reso| 
            puts "Table of #{reso.table_size}, open at #{reso.restaurant.name}"
        end
    end 
    def reserved
        resos = Reservation.where(restaurant: self , user_id: (1..100) )
        if resos.length > 0
            resos.each do |reso| 
                puts self.class.print_reso(reso)
            end
        else
            puts "No tables are currently reserved at your restaurant."
        end
    end 

    def self.print_reso(reso)
        if reso.user != nil
            "#{reso.user.name} - table of #{reso.table_size} - datetime: #{reso.datetime}"
        else
            "Table of #{reso.table_size} - datetime: #{reso.datetime}"
        end
    end

    def delete_booked_reso
        resos = Reservation.all.where(restaurant: self , user_id: (1..1000))
        # select
        if resos.length > 0
            @@prompt.select("Which reservation would you like to cancel?") do |q|
                resos.each do |reso|
                    q.choice Restaurant.print_reso(reso), -> {reso}
                end
            end.destroy
            puts "*** RESERVATION CANCELED ***"
        else
            puts "There are no booked reservations to cancel."
        end
    end

    def delete_open_reso
        resos = Reservation.all.where(restaurant: self, user_id: nil)
        if resos.length > 0
            @@prompt.select("Which reservation would you like to cancel?") do |q|
                resos.each do |reso|
                    q.choice Restaurant.print_reso(reso), -> {reso}
                end
            end.destroy
            puts "*** RESERVATION CANCELED ***"
        else
            puts "There are no open reservations to cancel."
        end
    end

    def create
        puts "What is the table size?"  
        table_size = gets.chomp
        # Creates a new reservation as the same datetime that the code is run
        created = Reservation.create!(restaurant: self, table_size: table_size, datetime: DateTime.now())
        puts "\nCreating listing for table of #{created.table_size} at #{created.datetime}."
        puts "*** Your reservation listing has been created ***"
    end
end
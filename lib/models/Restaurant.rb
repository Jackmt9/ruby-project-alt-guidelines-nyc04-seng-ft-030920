class Restaurant < ActiveRecord::Base
    has_many :reservations
    # has_many :users, through: reservations

    @@prompt = TTY::Prompt.new

    def self.list_by_name
        Restaurant.all.map(&:name)
    end
       
    def self.log_in
       @@prompt.select("Please select your restaurant from the following: ") do |q|
            Restaurant.all.each do |restaurant|
               q.choice restaurant.name, -> {restaurant}
            end
        end 
    end

    def open
        resos = Reservation.where(restaurant: self, user_id: nil)

        resos.each do |reso| 
            puts "Table of #{reso.table_size}, open at #{reso.restaurant.name}"
        end
    end 
    def reserved
        # Return reserved instances for a particular restaurant instance
       
        resos = Reservation.where(restaurant: self , user_id: (1..100) )
        #  binding.pry
        

        resos.each do |reso| 
            puts "Table of #{reso.table_size} , reserved for  #{reso.user.name}."
        end
     
    end 

    def change_table

    
        # puts "What was your old table size?"
        #  old_size = gets.chomp

        #  puts " How much do you want to change table size ? "
        # new_table_size  = gets.chomp

        # resos = Reservation.where(restaurant: self , table_size: old_size)
        #  if resos == []
        #     puts "No table reserved here"
        #     self.change_table
        #  else 
        #   resos.update(table_size: new_table_size)
        #  end

        # # resos.save
        # resos 
        # binding.pry
        


    end
    def self.print_reso(reso)
        "#{reso.user.name} , table of: #{reso.table_size}, datetime: #{reso.datetime}"
    end
    # reso = @@prompt.select("Which reservation would you like to cancel?") do |q|
    # #     Reservation.all.where(user: self).each do |reso|
    # #         q.choice User.print_reso(reso), -> {reso}
    #     end
    def delete
        # Prompt restaurant with list of reservations and ask which they wish to cancel
        reso = @@prompt.select("Which reservation do you want to cancel?") do |q|
               Reservation.all.where(restaurant: self , user_id: (1..100) ).each do |reso|
                q.choice Restaurant.print_reso(reso), -> {reso}
        #  binding.pry
        end
     end 
      reso.destroy
    
    end

    def create
        # Prompt restaurant with change options
        puts "What is the table size?"  
        size_of_table = gets.chomp
        # puts " Enter DateTime ? "
        # date_time = gets.chomp
        
       created = Reservation.create!(table_size: size_of_table , datetime: DateTime.now())
       puts "You have created a table of #{created.table_size} at your restaurant #{self.name}"
    
    end
end
class User < ActiveRecord::Base
    @@prompt = TTY::Prompt.new
    has_many :reservations
    def self.list_by_name
        Restaurant.all.map(&:name)
    end
    def self.log_in
        puts "\nPlease enter your full name: "
        name = gets.chomp
        if name == ""
            puts "#--------Invalid entry, please try again.---------#"
            log_in
        end
        User.find_or_create_by(name: name)
    end
    def self.print_reso(reso)
        "#{reso.restaurant.name}, table of: #{reso.table_size}, datetime: #{reso.datetime}"
    end
    def book
        reservation = @@prompt.select("Where would you like to dine?") do |q|
            Reservation.open.each do |reso|
                q.choice User.print_reso(reso), -> {reso}
            end
        end
        reservation.user = self
        reservation.save
        puts "#{self.name}, I've booked your reservation."
    end
    def find_resos
        resos = Reservation.all.where(user: self)
        if resos.length > 0
            puts "\nYour reservation(s):\n"
            resos.each do |reso|
                puts User.print_reso(reso)
            end
        else
            puts "\nYou have no booked reservations."
        end
    end
    def cancel_reso
        reso = @@prompt.select("Which reservation would you like to cancel?") do |q|
            Reservation.all.where(user: self).each do |reso|
                q.choice User.print_reso(reso), -> {reso}
            end
        end
        reso.destroy
    end
end
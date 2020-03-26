class User < ActiveRecord::Base

    @@prompt = TTY::Prompt.new(active_color: :blue)
    has_many :reservations
    def self.log_in
        puts "\nPlease enter your full name: "
        name = gets.strip
        if name == ""
            puts "#--------Invalid entry, please try again.---------#".colorize(:color => :red)
            log_in
        else
        User.find_or_create_by(name: name)
        end
    end

    def self.print_reso(reso)
        "#{reso.restaurant.name} - table of #{reso.table_size} - #{reso.datetime}"
    end
    def self.print_reso(reso)
        "#{reso.restaurant.name}, table of: #{reso.table_size}, datetime: #{reso.datetime}"
    end
    def book
        if Reservation.open.length > 0
            reservation = @@prompt.select("Where would you like to dine?") do |q|
                Reservation.open.each do |reso|
                    q.choice User.print_reso(reso), -> {reso}
                end
            end
            reservation.user = self
            reservation.save
            puts "\n*** #{self.name}, I've booked your reservation ***".colorize(:color => :green)
        else
            puts "There Are No Open Reservation Listings".colorize(:color => :red)
        end
    end
    def find_resos
        resos = Reservation.all.where(user: self)
        if resos.length > 0
            puts "\nYour reservation(s):\n"
            resos.each do |reso|
                puts User.print_reso(reso)
            end
        else
            puts "\n*** You have no booked reservations ***".colorize(:color => :red)
        end
    end
    def cancel_reso
        # if user is the last added in db, dont run
        if Reservation.all.where(user: self).length > 0
            reso = @@prompt.select("Which reservation would you like to cancel?") do |q|
                Reservation.all.where(user: self).each do |reso|
                    q.choice User.print_reso(reso), -> {reso}
                end
            end
            reso.update(user_id: nil)
            puts "\n*** Your Reservation Has Been Canceled ***".colorize(:color => :green)
        else puts "You Don't Have Any Reservations to Cancel.".colorize(:color => :red)
        end
    end
end
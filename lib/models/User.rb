class User < ActiveRecord::Base

    @@prompt = TTY::Prompt.new
    has_many :reservations

    def self.log_in
        puts "\nPlease enter your full name: "
        name = gets.strip
        if name == ""
            puts "#--------Invalid entry, please try again.---------#"
            log_in
        else
        User.find_or_create_by(name: name)
        end
    end

    def self.print_reso(reso)
        "#{reso.restaurant.name} - Table of #{reso.table_size} - #{reso.datetime}"
    end

    def book
        reservation = @@prompt.select("Where would you like to dine?") do |q|
            Reservation.open.each do |reso|
                q.choice User.print_reso(reso), -> {reso}
            end
        end
        reservation.user = self
        reservation.save
        puts "\n*** #{self.name}, I've booked your reservation ***"
    end

    def find_resos
        resos = Reservation.all.where(user: self)
        if resos.length > 0
            puts "\nYour reservation(s):\n"
            resos.each do |reso|
                puts User.print_reso(reso)
            end
        else
            puts "\n*** You have no booked reservations ***"
        end
    end

    def cancel_reso
        reso = @@prompt.select("Which reservation would you like to cancel?") do |q|
            Reservation.all.where(user: self).each do |reso|
                q.choice User.print_reso(reso), -> {reso}
            end
        end
        reso.destroy
        puts "\n*** Your Reservation Has Been Canceled ***"
    end
end
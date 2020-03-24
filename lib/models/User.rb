class User < ActiveRecord::Base

    @prompt = TTY::Prompt.new

    def self.list_by_name
        Restaurant.all.map(&:name)
    end

    def self.log_in
        puts "Please enter your full name: "
        name = gets.chomp
        User.find_by(name: name)
        Interface.user_menu
    end

    def self.create_account

        # Interface.user_menu
    end
end
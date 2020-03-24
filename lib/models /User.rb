class User < ActiveRecord::Base
    has_many :reservations
    def self.log_in
        # @prompt = TTY::Prompt.new
        # user = prompt.ask("What's your full name?")
        # self.find_or_create_by(name: user)
        puts "Please enter your full name"
        name = gets.chomp
        User.find_by(name: name)
        Interface.user_menu
    end
    def self.create_account
        Interface.user_menu
    end
end
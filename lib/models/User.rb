class User < ActiveRecord::Base

    @prompt = TTY::Prompt.new

    def self.list_by_name
        Restaurant.all.map(&:name)
    end

    def self.log_in
        puts "Please enter your full name: "
        name = gets.chomp
        User.find_or_create_by(name: name)
<<<<<<< HEAD
        
    end

    # def self.create_account
    #     prompt = TTY::Prompt.new
    #     name = prompt.ask("What do you want your username to be?")
    #     if User.find_by(name: name)
    #         puts "Sorry, the name has been taken"
    #    end
    #     puts "Please enter your full name: "
    #     name = gets.chomp
    #     User.create!(name: name)
       
    # end
=======
    end
>>>>>>> master
end
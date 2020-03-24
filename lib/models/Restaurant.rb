class Restaurant < ActiveRecord::Base

    @prompt = TTY::Prompt.new

    def self.list_by_name
        Restaurant.all.map(&:name)
    end

    def self.log_in
        @prompt.select("Please select your restaurant from the following: ", list_by_name)
        Interface.restaurant_menu
    end

    def self.create_account

    end
end
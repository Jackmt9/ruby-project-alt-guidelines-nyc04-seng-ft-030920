class CreateRestaurants < ActiveRecord::Migrate[5.1]

    def change 
        create table :restaurants do |t|
        t.string :name 
        end 
    end 
end 
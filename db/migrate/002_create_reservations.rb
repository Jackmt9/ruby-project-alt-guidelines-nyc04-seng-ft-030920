class CreateReservations < ActiveRecord::Migration[5.1]

    def change 
      create_table :reservations do |t|
        t.integer :restaurant_id 
        t.integer :user_id 
        t.integer :table_size 
        t.date :date 
        t.time :time

    end 
 end 
end 
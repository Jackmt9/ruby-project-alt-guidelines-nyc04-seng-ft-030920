class Reservation < ActiveRecord::Base
 belongs_to :restaurant 
 belongs_to :user


#  def self.list
#     Reservation.all.map do |reservation| 
#         reservation
        

#     end 
#  end 

 def self.list_empty_reservations 
     Reservation.all.where(user_id: nil)
    

 end 
end
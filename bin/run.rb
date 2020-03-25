  
require_relative '../config/environment'

# binding.pry
interface = Interface.new()
interface.welcome
type = interface.user_or_restaurant
if type == "User"
    user_inst = User.log_in
    interface.user_menu(user_inst)
elsif type == "Restaurant"
    rest_inst = Restaurant.log_in
<<<<<<< HEAD
   
=======
>>>>>>> master
    interface.restaurant_menu(rest_inst)
end

puts "That's all folks!"

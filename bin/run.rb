  
require_relative '../config/environment'
puts 'clear'
# binding.pry
ASCII.asc
(sleep 2)


interface = Interface.new()
puts `clear`
interface.welcome
type = interface.user_or_restaurant
if type == "User"
    user_inst = User.log_in
    interface.user_menu(user_inst)
elsif type == "Restaurant"
    rest_inst = Restaurant.log_in
    interface.restaurant_menu(rest_inst)
end
puts "ERROR: You've hit the end of your run file!".colorize(:color => :red)
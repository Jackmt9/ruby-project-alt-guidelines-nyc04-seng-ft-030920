require_relative '../config/environment'


interface = Interface.new()
interface.welcome
interface.user_or_restaurant
x = User.log_in
interface.user_menu(x)

puts "That's all folks!"

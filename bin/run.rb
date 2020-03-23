require_relative '../config/environment'
require_relative "../app/models/User.rb"

user 1  =  User.create(name: "Xavier")
puts User.find_by(name: "Xavier")


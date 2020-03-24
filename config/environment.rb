
require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
<<<<<<< HEAD
require_all 'lib'

# ActiveRecord::Base.logger = nil
=======
require_all 'lib'
>>>>>>> master

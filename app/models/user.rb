class User < ActiveRecord::Base
	# has_secure_password
	def self.authenticate(login, pass)
    		find(:first, :conditions=>["login = ? AND password = ?", login, pass])
    	end
end

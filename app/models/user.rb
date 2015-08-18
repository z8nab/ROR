class User < ActiveRecord::Base
	# has_secure_password
	def self.authenticate(pass)
    		find(:first, :conditions=>["password = ?",pass])
    	end
end

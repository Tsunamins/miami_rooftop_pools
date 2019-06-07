class User <ActiveRecord::Base 
    has_many :pools 
    has_secure_password 
end 
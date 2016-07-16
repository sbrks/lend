class User < ActiveRecord::Base

	has_many :items


	BCrypt::Engine.cost = 12

	validates :email, :password_digest, presence: true, uniqueness:true

	# validates_confirmation_of :password

	def self.confirm(email, password)
		user = User.find_by_email(email)
		user.authenticate(password)
	end

	has_secure_password

end

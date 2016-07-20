class User < ActiveRecord::Base

	has_secure_password

	acts_as_messageable

	# searchkick

	has_many :items

	# geocoded_by :latitude, :longitude
	
	# acts_as_mappable

	# reverse_geocoded_by :latitude, :longitude, :address => :location

	# after_validation :geocode


	BCrypt::Engine.cost = 12

	validates :email, :password_digest, presence: true, uniqueness:true

	# validates_confirmation_of :password

	def self.confirm(email, password)
		user = User.find_by_email(email)
		user.authenticate(password)
	end

	  def mailboxer_name
    	self.name
  		end

  		def mailboxer_email(object)
    		self.email
  		end



end

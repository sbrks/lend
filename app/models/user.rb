class User < ActiveRecord::Base

	has_many :items

	has_friendship

	#user search method
	def self.search(search)
   		where(
   			"first_name ILIKE ? OR 
 			last_name ILIKE ? OR
 			location ILIKE ? OR
 			email ILIKE ?",
 			"%#{search}%",
 			"%#{search}%",
 			"%#{search}%",
 			"%#{search}%"
 		)
 	end

#friendship methods
  def friend_request?(user)
    user && !friends_with?(user) && user.id.in?(requested_friend_ids)
  end

  def requested_friend_ids
    requested_friends.pluck(:id)
  end

  def friend_pending?(user)
   user && !friends_with?(user) && user.id.in?(pending_friend_ids)
  end

  def pending_friend_ids
    pending_friends.pluck(:id)
  end

	# geocoded_by :latitude, :longitude
	
	# acts_as_mappable

	# reverse_geocoded_by :latitude, :longitude, :address => :location

	BCrypt::Engine.cost = 12

	validates :email, :password_digest, presence: true, uniqueness:true

	# validates_confirmation_of :password

	def self.confirm(email, password)
		user = User.find_by_email(email)
		user.authenticate(password)
	end

	has_secure_password

end

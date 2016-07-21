class User < ActiveRecord::Base

	searchkick

	has_many :items

	has_friendship

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

	# after_validation :geocode
 def self.search(text)
   query = "%#{text}%"
   if text.present?
     return where("vision LIKE ?", query)
   end
 end

	BCrypt::Engine.cost = 12

	validates :email, :password_digest, presence: true, uniqueness:true

	# validates_confirmation_of :password

	def self.confirm(email, password)
		user = User.find_by_email(email)
		user.authenticate(password)
	end

	has_secure_password

end

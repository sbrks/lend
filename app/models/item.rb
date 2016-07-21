class Item < ActiveRecord::Base
	
	belongs_to :users

	def self.search(search)
   		where("title ILIKE ?", "%#{search}%") 
 		where("description ILIKE ?", "%#{search}%")
 		where("availability ILIKE ?", "%#{search}%")
 		where("price ILIKE ?", "%#{search}%")
 	end

end

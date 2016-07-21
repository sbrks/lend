class Item < ActiveRecord::Base
	
	belongs_to :users

	def self.search(search)
   		where(
   			"title ILIKE ? OR 
 			description ILIKE ? OR
 			availability ILIKE ? OR
 			price ILIKE ?",
 			"%#{search}%",
 			"%#{search}%",
 			"%#{search}%",
 			"%#{search}%"
 		)
 	end

end

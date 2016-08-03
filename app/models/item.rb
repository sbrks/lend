class Item < ActiveRecord::Base
	
	belongs_to :users

	#item search method
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

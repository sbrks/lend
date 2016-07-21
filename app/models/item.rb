class Item < ActiveRecord::Base
	
	belongs_to :users

	def self.search(search)
   		where("title LIKE ?", "%#{search}%") 
 		where("description LIKE ?", "%#{search}%")
 	end

 	#his will work in development with SQLite. If you switch to PostgreSQL in production, you may need to change  LIKE to  ILIKE
end

class AddPriceandAvailabilitytoItems < ActiveRecord::Migration
  def change
  	add_column :items, :price, :string
  	add_column :items, :availability, :string
  end
end

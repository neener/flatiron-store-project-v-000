class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_many :items, through: :line_items

	def total
		line_items.collect {|i| i.item.price * i.quantity}.inject(:+)
	end

	def add_item(item_id)
		item = Item.find(item_id)
		line_item = line_items.detect {|li| li.item == item}
		if line_item 
			line_item.quantity += 1
		else
			line_item = line_items.build
			line_item.item = item
		end
		line_item
	end
	
end

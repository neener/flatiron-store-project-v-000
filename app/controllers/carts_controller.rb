class CartsController < ApplicationController
	def show
		
	end

	def checkout
		current_user.current_cart.line_items.each do |item|
	      @item = Item.find(item.item_id)
	      @item.inventory -= item.quantity
	      @item.save
	    end
		redirect_to cart_path(current_user)
	end

end

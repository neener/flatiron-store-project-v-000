class CartsController < ApplicationController
	def show
		@cart = Cart.find(params[:id])
	end

	def checkout
		current_cart.line_items.each do |item|
		    @item = Item.find(item.item_id)
		    @item.inventory -= item.quantity
		    @item.save
	    end
		redirect_to cart_path(current_cart.id)
	end

end

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
	    current_cart.status = 'submitted'
	    current_cart.save
	    cart_id = current_cart.id
	    current_user.current_cart = nil
	    current_user.save
		redirect_to cart_path(cart_id)
	end

end

class LineItemsController < ApplicationController
	def create
		item = Item.find(params[:item_id])
		unless current_user.current_cart
			cart = current_user.carts.create
			current_user.update(:current_cart_id => cart.id)
		end
		@line_item = current_user.current_cart.add_item(item.id)
		if @line_item.save
			redirect_to cart_path(current_user.current_cart), notice: 'Item added to cart!'
		else
			redirect_to store_path
		end
	end
end


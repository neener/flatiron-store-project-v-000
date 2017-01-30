class LineItemsController < ApplicationController
	def create
		item = Item.find(params[:item_id])
		@line_item = current_cart.add_item(item.id)
		if @line_item.save
			redirect_to cart_path(current_cart), notice: 'Item added to cart!'
		else
			redirect_to store_path
		end
	end
end

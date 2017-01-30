require 'pry'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_cart

  def current_cart
  	# binding.pry
  	if session[:cart_id]
 		Cart.find(session[:cart_id])
 	else
	 	cart = Cart.create
	 	cart.user = current_user
	 	cart.save
	 	cart
 	end
  end

end



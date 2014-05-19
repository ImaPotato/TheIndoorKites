module PricesHelper

	def new_or_edit_price_path(price)
		# my condition here is a bit yucky
    	!Price.count.zero? ? edit_price_path(price) : new_price_path
 	end
end

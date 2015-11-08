class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_product(product, params)
		quantity = params[:quantity].to_i || 1
		current_item = line_items.find_by(product_id: product.id)
		if current_item
			current_item.quantity += quantity
		else
			current_item = line_items.build(product_id: product.id)
			current_item.quantity = quantity
		end
		current_item
	end

	def total_price
		line_items.to_a.sum {|x| x.total_price}
	end

	def total_quantity
		line_items.sum :quantity
	end
end

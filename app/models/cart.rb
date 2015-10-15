class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_product(product_id)
		current_item = line_items.find_by(product_id: product_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(product_id: product_id)
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

#encoding: utf-8
class Product < ActiveRecord::Base
	has_many :line_items

	attr_accessor :quantity

	before_destroy :ensure_not_referenced_by_any_line_item

	validates :title, :description, :article, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :article, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'URL должен указывать на изображение формата GIF, JPG или PNG.'
	}
	validates :title, length: {minimum: 10}

	def quantity
	  @quantity || 1
	end

	def quantity=(value)
	  @quantity = value
	end

	private

	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'существуют товарные позиции')
			return false
		end
	end
end
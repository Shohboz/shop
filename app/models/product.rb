#encoding: utf-8

require 'babosa'

class Product < ActiveRecord::Base
	searchkick
	extend FriendlyId
	friendly_id :slug_candidates, use: [:slugged, :finders]

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
	validates :title, length: {minimum: 5}

	def slug_candidates
		[
			:title,
			[:title, :id]
		]
	end

	def normalize_friendly_id(text)
		text.to_s.to_slug.normalize(transliterations: :russian).to_s
	end

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
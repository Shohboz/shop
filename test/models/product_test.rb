#encoding: utf-8
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  # test "the truth" do
  #   assert true
  # end
  test "product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:price].any?
  	assert product.errors[:image_url].any?
  	assert product.errors[:article].any?
  end

  test "product price must be positive" do
  	product = Product.new(title: "Walls",
  		description: "new walls",
  		image_url: "walls.jpg",
  		article: "555-666")
  	
  	product.price = -1
  	assert product.invalid?
  	assert_equal ["must be greater than or equal to 0.01"],
  		product.errors[:price]
  	
  	product.price = 0
  	assert product.invalid?
  	assert_equal ["must be greater than or equal to 0.01"],
  		product.errors[:price]
  	
  	product.price = 1
  	assert product.valid?, "#{product.price} must be positive"
  end

  def new_product(image_url)
  	Product.new(title: "Ball on the Wall",
  		description: "put your balls on the wall",
  		price: 1,
  		article: "7-7-7",
  		image_url: image_url)
  end

  test "image url" do
  	ok = %w{fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif}
  	bad = %w{fred.doc fred.gif/more fred.gif.more}

  	ok.each do |name|
  		assert new_product(name).valid?, "#{name} shouldn't be invalid"
  	end

  	bad.each do |name|
  		assert new_product(name).invalid?, "#{name} shouldn't be valid"
  	end
  end
=begin
  test "product is not valid without a unique article" do
  	product = Product.new(title: "Petropah",
  		description: "walls walls walls",
  		price: 1,
  		image_url: "fred.png",
  		article: products(:ruby).article)

  	assert product.invalid?
  	assert_equal ["has already been taken"], product.errors[:article]
  end
=end
end

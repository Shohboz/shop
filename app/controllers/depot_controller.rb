class DepotController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
  	@products = Product.order(:title)
  end

  def show
  	@product = Product.find(params[:id])
  end
end

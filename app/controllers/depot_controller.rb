class DepotController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def search
    if params[:search].present?
      @products = Product.search params[:search], misspellings: {edit_distance: 3, transpositions: true, partial: true}
    else
      @products = Product.order(:title).page(params[:page]).per(12)
    end
  end

  def index
    @products = Product.order(:title).page(params[:page]).per(12)
  end

  def show
  	@product = Product.find(params[:id])
  end

  def payment
  end
end

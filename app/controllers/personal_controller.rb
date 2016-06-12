class PersonalController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def show
    @user = User.find(params[:id])
  end

  def orders
  end
end

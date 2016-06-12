class PersonalController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def orders
  end
end

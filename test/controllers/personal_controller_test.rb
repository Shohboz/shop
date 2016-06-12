require 'test_helper'

class PersonalControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get orders" do
    get :orders
    assert_response :success
  end

end

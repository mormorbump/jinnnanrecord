require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get carts_show_url
    assert_response :success
  end

  test "should get complete" do
    get carts_complete_url
    assert_response :success
  end

end

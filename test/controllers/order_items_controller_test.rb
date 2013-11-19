require 'test_helper'

class OrderItemsControllerTest < ActionController::TestCase
  test "should get add_item" do
    get :add_item
    assert_response :success
  end

  test "should get remove_item" do
    get :remove_item
    assert_response :success
  end

end

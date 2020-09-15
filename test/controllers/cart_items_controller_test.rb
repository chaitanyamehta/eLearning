require 'test_helper'

class CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cart_items_index_url
    assert_response :success
  end

  test "should get new" do
    get cart_items_new_url
    assert_response :success
  end

  test "should get create" do
    get cart_items_create_url
    assert_response :success
  end

  test "should get destroy" do
    get cart_items_destroy_url
    assert_response :success
  end

  test "should get clear" do
    get cart_items_clear_url
    assert_response :success
  end

  test "should get checkout" do
    get cart_items_checkout_url
    assert_response :success
  end

end

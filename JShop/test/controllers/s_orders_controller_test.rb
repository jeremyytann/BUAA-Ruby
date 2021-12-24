require "test_helper"

class SOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @s_order = s_orders(:one)
  end

  test "should get index" do
    get s_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_s_order_url
    assert_response :success
  end

  test "should create s_order" do
    assert_difference('SOrder.count') do
      post s_orders_url, params: { s_order: { order_id: @s_order.order_id, price: @s_order.price, product_id: @s_order.product_id, quantity: @s_order.quantity, seller_id: @s_order.seller_id, status: @s_order.status, user_id: @s_order.user_id } }
    end

    assert_redirected_to s_order_url(SOrder.last)
  end

  test "should show s_order" do
    get s_order_url(@s_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_s_order_url(@s_order)
    assert_response :success
  end

  test "should update s_order" do
    patch s_order_url(@s_order), params: { s_order: { order_id: @s_order.order_id, price: @s_order.price, product_id: @s_order.product_id, quantity: @s_order.quantity, seller_id: @s_order.seller_id, status: @s_order.status, user_id: @s_order.user_id } }
    assert_redirected_to s_order_url(@s_order)
  end

  test "should destroy s_order" do
    assert_difference('SOrder.count', -1) do
      delete s_order_url(@s_order)
    end

    assert_redirected_to s_orders_url
  end
end

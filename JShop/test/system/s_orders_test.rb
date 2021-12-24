require "application_system_test_case"

class SOrdersTest < ApplicationSystemTestCase
  setup do
    @s_order = s_orders(:one)
  end

  test "visiting the index" do
    visit s_orders_url
    assert_selector "h1", text: "S Orders"
  end

  test "creating a S order" do
    visit s_orders_url
    click_on "New S Order"

    fill_in "Order", with: @s_order.order_id
    fill_in "Price", with: @s_order.price
    fill_in "Product", with: @s_order.product_id
    fill_in "Quantity", with: @s_order.quantity
    fill_in "Seller", with: @s_order.seller_id
    fill_in "Status", with: @s_order.status
    fill_in "User", with: @s_order.user_id
    click_on "Create S order"

    assert_text "S order was successfully created"
    click_on "Back"
  end

  test "updating a S order" do
    visit s_orders_url
    click_on "Edit", match: :first

    fill_in "Order", with: @s_order.order_id
    fill_in "Price", with: @s_order.price
    fill_in "Product", with: @s_order.product_id
    fill_in "Quantity", with: @s_order.quantity
    fill_in "Seller", with: @s_order.seller_id
    fill_in "Status", with: @s_order.status
    fill_in "User", with: @s_order.user_id
    click_on "Update S order"

    assert_text "S order was successfully updated"
    click_on "Back"
  end

  test "destroying a S order" do
    visit s_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "S order was successfully destroyed"
  end
end

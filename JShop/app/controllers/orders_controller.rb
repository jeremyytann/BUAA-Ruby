class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new create ]
  before_action :check_buyer, only: %i[ index edit ]
  before_action :check_buyer_new, only: %i[ new ]

  # GET /orders or /orders.json
  def index
    if current_user.role == 1
      @orders = Order.where(user_id: current_user.id).reverse
    else
      redirect_to root_path
    end
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end
  
  # Cancel every s_orders
  def is_cancelled
    @order = Order.find(params[:id])
    @s_orders = SOrder.where(order_id: @order.id)

    @s_orders.each do |s_order|
      s_order.update(status: "Cancelled")
    end

    redirect_back(fallback_location: @order)
  end

  # Complete every s_orders
  def is_completed
    @order = Order.find(params[:id])
    @s_orders = SOrder.where(order_id: @order.id)

    @s_orders.each do |s_order|
      s_order.update(status: "Completed")
    end

    redirect_back(fallback_location: @order)
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    @owner_carts = Cart.where(user_id: @order.user_id)

    @owner_carts.each do |owned_cart|
      @cart_product = Product.find_by(id: owned_cart.product_id)
      @cart_product.update(sales: @cart_product.sales + 1)
      @new_order = SOrder.create(user_id: current_user.id, product_id: owned_cart.product_id, quantity: owned_cart.quantity, price: (@cart_product.price * owned_cart.quantity).to_f, seller_id: @cart_product.user_id, order: @order, status: "Paid")
    end

    respond_to do |format|
      if @order.save
        Cart.where(user_id: @order.user_id).destroy_all
        format.html { redirect_to @order, notice: "Order was successfully updated." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def check_buyer
    if current_user.role == 2
      redirect_to root_path
    end
  end

  def check_buyer_new
    if current_user.role == 1
      redirect_to root_path
    elsif current_user.role == 2
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.permit(:user_id, :deal_sum, :delivery_address, :delivery_name, :delivery_phone, :order_status)
    end
end

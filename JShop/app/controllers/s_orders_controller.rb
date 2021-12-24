class SOrdersController < ApplicationController
  before_action :set_s_order, only: %i[ show edit update destroy ]

  # GET /s_orders or /s_orders.json
  def index
    @s_orders = SOrder.where(seller_id: current_user.id)
  end

  # GET /s_orders/1 or /s_orders/1.json
  def show
  end

  # GET /s_orders/new
  def new
    @s_order = SOrder.new
  end

  # GET /s_orders/1/edit
  def edit
  end

  # POST /s_orders or /s_orders.json
  def create
    @s_order = SOrder.new(s_order_params)

    respond_to do |format|
      if @s_order.save
        format.html { redirect_to @s_order, notice: "S order was successfully created." }
        format.json { render :show, status: :created, location: @s_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @s_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /s_orders/1 or /s_orders/1.json
  def update
    respond_to do |format|
      if @s_order.update(s_order_params)
        format.html { redirect_to @s_order, notice: "S order was successfully updated." }
        format.json { render :show, status: :ok, location: @s_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @s_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /s_orders/1 or /s_orders/1.json
  def destroy
    @s_order.destroy
    respond_to do |format|
      format.html { redirect_to s_orders_url, notice: "S order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_s_order
      @s_order = SOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def s_order_params
      params.require(:s_order).permit(:user_id, :product_id, :quantity, :price, :order_id, :seller_id, :status)
    end
end

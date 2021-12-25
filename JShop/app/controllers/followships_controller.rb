class FollowshipsController < ApplicationController
  before_action :set_followship, only: %i[ show edit update destroy ]
  before_action :save_shop, only: %i[ destroy ]

  # GET /followships or /followships.json
  def index
    @followships = Followship.where(user_id: current_user.id)

  end

  # GET /followships/1 or /followships/1.json
  def show
  end

  # GET /followships/new
  def new
    @followship = Followship.new
  end

  # GET /followships/1/edit
  def edit
  end

  # POST /followships or /followships.json
  def create
    @followship = Followship.new(followship_params)

    respond_to do |format|
      if @followship.save
        @shop = Shop.find_by(id: params[:shop_id])
        format.html { redirect_to @shop }
        format.json { render :show, status: :created, location: @followship }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @followship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /followships/1 or /followships/1.json
  def update
    respond_to do |format|
      if @followship.update(followship_params)
        format.html { redirect_to @followship, notice: "Followship was successfully updated." }
        format.json { render :show, status: :ok, location: @followship }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @followship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /followships/1 or /followships/1.json
  def destroy
    @followship.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: @shop) }
      format.json { head :no_content }
    end
  end

  def save_shop
    @shop = Shop.find_by(id: params[:shop_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_followship
      @followship = Followship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def followship_params
      params.permit(:user_id, :shop_id)
    end
end

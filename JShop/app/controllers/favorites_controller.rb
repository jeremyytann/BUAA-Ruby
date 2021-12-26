class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[ show edit update destroy ]
  before_action :check_for_same?, only: %i[ new create ]
  before_action :check_buyer, only: %i[ index ]

  # GET /favorites or /favorites.json
  def index
    if user_signed_in?
      if current_user.role == 1
        @owned_favorites = Favorite.where(user_id: current_user.id)
      end
    end
  end

  # GET /favorites/1 or /favorites/1.json
  def show
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites or /favorites.json
  def create
    if @already
      return
    end

    @favorite = Favorite.new(favorite_params)

    respond_to do |format|
      if @favorite.save
        @product = Product.find_by(id: params[:product_id])
        format.html { redirect_to @product, notice: "Favorite was successfully updated." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorites/1 or /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: "Favorite was successfully updated." }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1 or /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: "Favorite was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def check_for_same?
    if Favorite.find_by(user_id: params[:user_id], product_id: params[:product_id])
      @already = true
      return
    end
  end

  def check_buyer
    if current_user.role == 2
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_params
      params.permit(:product_id, :user_id)
    end
end

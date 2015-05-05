class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites.all
  end
  
  def create
    @favorite = current_user.favorites.create(favorite_params)

    @favorite.save ? (redirect_to favorites_path) : ( render :new)
  end

  def new
  	@favorite = Favorite.new
  end

  def show
    @favorite =current_user.favorites.find(params[:id])
  end

  def edit
    @favorite = current_user.favorites.find(params[:id])
  end

  def update
    @favorite = current_user.favorites.find(params[:id])

    @favorite.update(favorite_params) ? (redirect_to favorites_path) : (render :edit)
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    @favorite.destroy
    redirect_to favorites_path
  end

  private

  def favorite_params
    params.require(:favorite).permit(:device, :name, :address, :remark)
  end
end

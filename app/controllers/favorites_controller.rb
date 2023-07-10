class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
    render :index
  end

  def create
    @favorite = Favorite.create(
      user_id: params[:user_id],
      movie_id: params[:movie_id],
    )
    render :show
  end

  def show
    @favorite = Favorite.find_by(id: params[:id])
    render :show
  end

  def update
    @favorite = Favorite.find_by(id: params[:id])
    @favorite.update(
      user_id: params[:user_id] || @favorite.user_id
      movie_id: params[:movie_id] || @favorite.movie_id
    )
    render :show
  end

  def destroy
    @favorite = Favorite.find_by(id: params[:id])
    @favorite.destroy
    render json: { message: "Removed from Favorites list" }
  end
end

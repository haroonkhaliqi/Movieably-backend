class FavoritesController < ApplicationController
  before_action :authenticate_user

  def index
    @favorites = current_user.favorites
    render json: @favorites
  end

  def create
    @favorite = Favorite.new(
      user_id: current_user.id,
      movie_id: params[:movie_id],
    )

    if @favorite.save
      render json: @favorite, status: :created
    else
      render json: { error: @favorite.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @favorite = Favorite.find_by(user_id: current_user, movie_id: params[:movie_id])
    render :show
  end

  # def update
  #   @favorite = Favorite.find_by(id: params[:id])
  #   @favorite.update(
  #     user_id: current_user.id || @favorite.current_user.id
  #     movie_id: params[:movie_id] || @favorite.movie_id
  #   )
  #   render :show
  # end

  def destroy
    @favorite = Favorite.find_by(user: current_user, movie_id: params[:id])

    if @favorite
      @favorite.destroy
      head :no_content
    else
      render json: { error: "Not a Favorite" }, status: :not_found
    end
  end
end

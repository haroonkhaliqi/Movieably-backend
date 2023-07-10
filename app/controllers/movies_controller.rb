class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render :index
  end

  def create
    @movie = Movie.create(
      title: params[:title],
      year: params[:year],
      rated: params[:rated],
      released: params[:released],
      runtime: params[:runtime],
      genre: params[:genre],
      director: params[:director],
      writer: params[:writer],
      actors: params[:actors],
      plot: params[:plot],
      language: params[:language],
      country: params[:country],
      awards: params[:awards],
      poster: params[:poster],
    )
    render :show
  end
end

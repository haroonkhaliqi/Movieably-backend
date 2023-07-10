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

  def show
    @movie = Movie.find_by(id: params[:id])
    render :show
  end
  
  def update
    @movie = Movie.find_by(id: params[:id])
    @movie.update(
      title: params[:title] || @movie.title,
      year: params[:year] || @movie.year,
      rated: params[:rated] || @movie.rated,
      released: params[:released] || @movie.released,
      runtime: params[:runtime] || @movie.runtime,
      genre: params[:genre] || @movie.genre,
      director: params[:director] || @movie.director,
      writer: params[:writer] || @movie.writer,
      actors: params[:actors] || @movie.actors,
      plot: params[:plot] || @movie.plot,
      language: params[:language] || @movie.langauge,
      country: params[:country] || @movie.country,
      awards: params[:awards] || @movie.awards,
      poster: params[:poster] || @movie.poster,
    )
    render :show
  end
end

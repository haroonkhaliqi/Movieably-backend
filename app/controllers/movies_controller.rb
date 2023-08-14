class MoviesController < ApplicationController
  def index
    response = HTTP.auth("Bearer #{ENV["MOVIE_ACCESS_TOKEN"]}").get("https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_genres=%2C")
    movie_data = response.parse(:json)
    movies = movie_data["results"]
    render json: movies
  end

  # def create
  #   @movie = Movie.create(
  #     title: params[:title],
  #     year: params[:year],
  #     rated: params[:rated],
  #     released: params[:released],
  #     runtime: params[:runtime],
  #     genre: params[:genre],
  #     director: params[:director],
  #     writer: params[:writer],
  #     actors: params[:actors],
  #     plot: params[:plot],
  #     language: params[:language],
  #     country: params[:country],
  #     awards: params[:awards],
  #     poster: params[:poster],
  #   )
  #   render :show
  # end

  # def show
  #   @movie = Movie.find_by(id: params[:id])
  #   render :show
  # end
  
  # def update
  #   @movie = Movie.find_by(id: params[:id])
  #   @movie.update(
  #     title: params[:title] || @movie.title,
  #     year: params[:year] || @movie.year,
  #     rated: params[:rated] || @movie.rated,
  #     released: params[:released] || @movie.released,
  #     runtime: params[:runtime] || @movie.runtime,
  #     genre: params[:genre] || @movie.genre,
  #     director: params[:director] || @movie.director,
  #     writer: params[:writer] || @movie.writer,
  #     actors: params[:actors] || @movie.actors,
  #     plot: params[:plot] || @movie.plot,
  #     language: params[:language] || @movie.langauge,
  #     country: params[:country] || @movie.country,
  #     awards: params[:awards] || @movie.awards,
  #     poster: params[:poster] || @movie.poster,
  #   )
  #   render :show
  # end

  # def destroy
  #   @movie = Movie.find_by(id: params[:id])
  #   @movie.destroy
  #   render json: { message: "Movie destroyed successfully"}
  # end
end

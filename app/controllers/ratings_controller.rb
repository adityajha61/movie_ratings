class RatingsController < ApplicationController
  before_action :set_movie

  def create
    @rating = @movie.ratings.build(rating_params)
    @rating.user = current_user
    if @rating.save
      redirect_to @movie, notice: "Rating added."
    else
        render "movies/show"
    end
  end

  def destroy
    @rating = @movie.ratings.find(params[:id])
    @rating.destroy

    redirect_to @movie, notice: "Rating deleted."
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def rating_params
    params.require(:rating).permit(:score)
  end
end

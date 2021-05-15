class FacilityGenresController < ApplicationController

  def index
    @facility_genres = FacilityGenre.all
    @new_genre = FacilityGenre.new
  end

  def create
    @new_genre = FacilityGenre.new(facility_genre_params)
    binding.pry
    @new_genre.save
    redirect_to facility_genres_path
  end

  private
  def facility_genre_params
    params.require(:facility_genre).permit(:name)
  end

end

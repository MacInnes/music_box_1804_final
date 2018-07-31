class Admin::GenresController < Admin::BaseController

  def create
    genre = Genre.create(name: params[:genre][:name])
    redirect_to genres_path
  end
  
end

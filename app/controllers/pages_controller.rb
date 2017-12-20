class PagesController < ApplicationController

  def home
    redirect_to pets_path if logged_in?
    @images = Pet.all
  end

  def about

  end

end

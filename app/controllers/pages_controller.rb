class PagesController < ApplicationController
  def index
    redirect_to trips_path if user_signed_in?
    #render "pages/home"
  end
end

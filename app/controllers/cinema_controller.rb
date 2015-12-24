class CinemaController < ApplicationController
  def show
    @cinema = Cinema.find(params[:id])
  end
end

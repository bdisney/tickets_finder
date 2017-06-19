class SearchesController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @trains = Search.find_train(params[:departure_station],
                                params[:arrival_station])
    if @trains.present?
      @departure_station = RailwayStation.find(params[:departure_station])
      @arrival_station   = RailwayStation.find(params[:arrival_station])
      render :show
    else
      redirect_to search_path, notice: 'По вашему запросу ничего не найдено.'
    end
  end
end
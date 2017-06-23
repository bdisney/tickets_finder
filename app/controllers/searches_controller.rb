class SearchesController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @trains = Search.find_train(params[:departure_station],
                                params[:arrival_station])

    respond_to do |format|
      if @trains.present?
        @departure_station = RailwayStation.find(params[:departure_station])
        @arrival_station   = RailwayStation.find(params[:arrival_station])
        format.js

      else
        format.html {render :show}
        format.js
      end
    end
  end
end

class CarriagesController < ApplicationController
  PERMITTED_PARAMS = {
      EconomyCarriage:  [:top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats],
      CoupeCarriage:    [:top_seats, :bottom_seats],
      SittingCarriage:  [:seats],
      BusinessCarriage: [:bottom_seats]
  }.freeze

  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def edit
  end

  def create
    @carriage = Carriage.new(carriage_params)

    if @carriage.save
      redirect_to carriage_path(@carriage), notice: 'Carriage was successfully created.'
    else
      render :new
    end

  end

  def update
    if @carriage.update(carriage_params)
      redirect_to carriage_path(@carriage), notice: 'Carriage was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_url, notice: 'Carriage was successfully destroyed.'
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(permitted_params)
  end

  def permitted_params
    PERMITTED_PARAMS[params[:carriage][:type].to_sym].concat([:train_id, :type])
  end
end

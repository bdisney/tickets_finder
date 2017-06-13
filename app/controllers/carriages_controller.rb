class CarriagesController < ApplicationController
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
    @carriage = carriage_class.new(carriage_params(carriage_class))

    if @carriage.save
      redirect_to carriage_path(@carriage), notice: 'Carriage was successfully created.'
    else
      render :new
    end

  end

  def update
    if @carriage.update(carriage_params(@carriage.class))
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

  def carriage_class
    @carriage_class ||= params[:carriage][:type].constantize
  end

  def carriage_params(carriage_class)
    params.require(:carriage).permit(carriage_class.permitted_params)
  end
end

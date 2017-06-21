class Admin::CarriagesController < Admin::BaseController
  PERMITTED_PARAMS = {
      EconomyCarriage:  [:top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats],
      CoupeCarriage:    [:top_seats, :bottom_seats],
      SittingCarriage:  [:seats],
      BusinessCarriage: [:bottom_seats]
  }.freeze

  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train,    only: [:new, :create, :edit, :update]

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
    @carriage = @train.carriages.new(carriage_params)

    if @carriage.save
      redirect_to admin_train_path(@train), notice: t('.notice')
    else
      render :new
    end

  end

  def update
    if @carriage.update(carriage_params)
      redirect_to admin_train_path(@train), notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to admin_train_path(@carriage.train), notice: t('.notice')
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

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

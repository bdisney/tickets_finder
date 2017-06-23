class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize!

  layout 'admin'

  protected

  def authorize!
    redirect_to root_path, alert: 'Доступ закрыт' unless current_user.admin?
  end
end
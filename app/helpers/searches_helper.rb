module SearchesHelper
  def ticket_path_helper(train)
    params = {
        train_id: train.id,
        start_station_id: @departure_station,
        last_station_id: @arrival_station
    }
    path = user_signed_in? && current_user.admin? ? new_admin_ticket_path(params) : new_ticket_path(params)
  end
end
class AddRelationsToTickets < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :tickets, :train, index: true
    add_belongs_to :tickets, :user, index: true
    add_belongs_to :tickets, :start_station, index: true
    add_belongs_to :tickets, :last_station, index: true
  end
end

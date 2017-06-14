class AddOrderFromEndColumnToTrain < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :order_from_end, :boolean, default: false
  end
end

class CreateCarriages < ActiveRecord::Migration[5.0]
  def change
    create_table :carriages do |t|
      t.integer :number
      t.integer :top_seats, :bottom_seats, default: 0
      t.integer :side_top_seats, :side_bottom_seats, default: 0
      t.integer :seats, default: 0
      t.string :type

      t.timestamps
    end

    add_belongs_to :carriages, :train, index: true
  end
end

class CreateCarriages < ActiveRecord::Migration[5.0]
  def change
    create_table :carriages do |t|
      t.string :variation
      t.integer :top_seats, :bottom_seats

      t.timestamps
    end

    add_belongs_to :carriages, :train, index: true
  end
end

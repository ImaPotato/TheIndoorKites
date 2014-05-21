class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :company_id
      t.string :location_one
      t.string :location_one_drop_down
      t.string :location_two
      t.string :location_two_drop_down
      t.decimal :weight_cost
      t.decimal :volume_cost
      t.decimal :max_weight
      t.decimal :max_volume
      t.integer :duration
      t.integer :frequency
      t.string :priority
      t.string :day

      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday

      t.boolean :utilised

      t.timestamps
    end
  end
end

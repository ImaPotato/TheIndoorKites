class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :company_id
      t.string :location_one
      t.string :location_two
      t.decimal :weight_cost
      t.decimal :volume_cost
      t.decimal :max_weight
      t.decimal :max_volume
      t.integer :duration
      t.integer :frequency
      t.string :priority
      t.string :day
      t.boolean :utilised

      t.timestamps
    end
  end
end

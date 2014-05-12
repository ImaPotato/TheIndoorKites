class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.decimal :i_air_weight_cost
      t.decimal :i_air_volume_cost
      t.decimal :i_land_weight_cost
      t.decimal :i_land_volume_cost
      t.decimal :d_air_weight_cost
      t.decimal :d_air_volume_cost
      t.decimal :d_land_weight_cost
      t.decimal :d_land_volume_cost

      t.timestamps
    end
  end
end

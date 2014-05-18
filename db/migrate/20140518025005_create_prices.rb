class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.decimal :i_air_w_cost
      t.decimal :i_air_v_cost
      t.decimal :i_land_w_cost
      t.decimal :i_land_v_cost
      t.decimal :d_air_w_cost
      t.decimal :d_air_v_cost
      t.decimal :d_land_w_cost
      t.decimal :d_land_v_cost

      t.timestamps
    end
  end
end

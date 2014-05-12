class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :to
      t.string :from
      t.string :weight
      t.decimal :weight_cost
      t.decimal :volume_cost
      t.decimal :max_weight
      t.integer :max_volume
      t.time :duration
      t.integer :frequency
      t.string :day
      t.string :utilized
      t.integer :connection_id

      t.timestamps
    end
  end
end

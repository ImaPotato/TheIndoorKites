class CreateMail < ActiveRecord::Migration
  def change
    create_table :mail do |t|
      t.string :day
      t.string :to
      t.string :from
      t.decimal :weight
      t.integer :volume
      t.string :priority
      t.datetime :send_date
      t.datetime :receive_date
      t.time :max_delivery_time
      t.decimal :cost
      t.integer :tracking_number

      t.timestamps
    end
  end
end

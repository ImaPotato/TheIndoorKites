class CreateMail < ActiveRecord::Migration
  def change
    create_table :mail do |t|
      t.string :sender
      t.string :receiver
      t.string :to
      t.string :from
      t.decimal :weight
      t.decimal :volume
      t.string :priority
      t.date :send_date
      t.date :receive_date
      t.date :max_delivery_time
      t.decimal :cost
      t.string :current_location
      t.boolean :international
      t.integer :route_id
      t.decimal :price

      t.timestamps
    end
  end
end

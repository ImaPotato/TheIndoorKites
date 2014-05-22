class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :company_id
      t.integer :connection_id
      t.integer :location_id
      t.integer :mail_id
      t.integer :price_id
      t.string :event_details
      t.string :event_time
      t.string :event_type
      t.timestamps
    end
  end
end

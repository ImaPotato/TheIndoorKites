class CreateMailHistories < ActiveRecord::Migration
  def change
    create_table :mail_histories do |t|
      t.string :action
      t.datetime :date
      t.string :location
      t.string :user
      t.integer :tracking_number

      t.timestamps
    end
  end
end

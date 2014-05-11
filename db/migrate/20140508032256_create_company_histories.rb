class CreateCompanyHistories < ActiveRecord::Migration
  def change
    create_table :company_histories do |t|
      t.string :action
      t.datetime :date
      t.string :user
      t.integer :connection_id

      t.timestamps
    end
  end
end

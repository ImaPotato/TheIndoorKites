class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.boolean :is_deleted
      t.timestamps
    end
  end
end

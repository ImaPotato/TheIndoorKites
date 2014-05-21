class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :transportation_type

      t.timestamps
    end
  end
end

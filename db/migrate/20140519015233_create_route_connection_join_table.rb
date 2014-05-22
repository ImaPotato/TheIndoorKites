class CreateRouteConnectionJoinTable < ActiveRecord::Migration
  def self.up
    create_table :connections_routes, :id => false do |t|
      t.integer :route_id
      t.integer :connection_id

      t.timestamps
    end
  end

  def self.down
    drop_table :connections_routes
  end
end

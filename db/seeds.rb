# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({email: "admin@kps.com", password:"password"  ,is_manager: true})
User.create({email: "clerk@kps.com", password:"password", is_manager: false})


company_strings = ["Air NZ", "Kelburn Airways", "Qantas", "Kelburn Freight", "Rodney's Longhaul", "Roman Air Freight Ltd", "Pacifica Merchants", "Davy Jones Ltd"]

companies = Hash.new

company_strings.each do |name|
  companies[name] = Company.create({company_name:name})
end

Connection.create({company_id: companies["Air NZ"].id,location_one:"Auckland", location_two: "Hamilton", weight_cost: 3, volume_cost: 3, max_weight: 3, max_volume: 3, duration: 3, frequency: 3, priority:"Air", day:"Monday", utilised: true})

=begin
"location_one"
    t.string   "location_two"
    t.decimal  "weight_cost"
    t.decimal  "volume_cost"
    t.decimal  "max_weight"
    t.decimal  "max_volume"
    t.integer  "duration"
    t.integer  "frequency"
    t.string   "priority"
    t.string   "day"
    t.boolean  "utilised"
    t.datetime "created_at"
    t.datetime "updated_at"
=end

#distribution_centers = ["Auckland", "Hamilton", "Rotorua", "Palmerston North",
#{}"Wellington", "Christchurch", "Dunedin"]

#for distribution_centers do | center|
#	
#end

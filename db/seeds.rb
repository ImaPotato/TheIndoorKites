# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({email: "admin@kps.com", password:"password"  ,is_manager: true})
User.create({email: "clerk@kps.com", password:"password", is_manager: false})

# The names of the companys and distrubution centers
company_strings = ["Air NZ", "Kelburn Airways", "Qantas", "Kelburn Freight", "Rodney's Longhaul", "Roman Air Freight Ltd", "Pacifica Merchants", "Davy Jones Ltd"]
available_locations = ["Auckland", "Hamilton", "Rotorua", "Palmerston North",
"Wellington", "Christchurch", "Dunedin", "Rome"]

# Hashs for so that the created instances can be referenced by their name
locations = Hash.new
companies = Hash.new

# Creates a new company based on its name and adds it to the hash table and to the database
company_strings.each do |name|
  companies[name] = Company.create({company_name:name})
end

# Creates a distribution center based on its location and adds it to the hash table and to the database
available_locations.each do | center|
	locations[center] = Location.create({name:center})
end

Connection.create({company_id: companies["Air NZ"].id, location_one:"Wellington", location_two: "Rome", weight_cost: 6, volume_cost: 6, max_weight: 350, max_volume: 50, duration: 16, frequency: 36, priority:"International Air", day: "Thursday", utilised: true})
Connection.create({company_id: companies["Kelburn Airways"].id, location_one:"Wellington", location_two: "Sydney", weight_cost: 2, volume_cost: 0, max_weight: 800, max_volume: 80, duration: 3, frequency: 12, priority:"International Air", day: "Friday", utilised: true})
Connection.create({company_id: companies["Qantas"].id, location_one:"Wellington", location_two: "Sydney", weight_cost: 2, volume_cost: 1, max_weight: 700, max_volume: 60, duration: 3, frequency: 12, priority:"International Air", day: "Monday", utilised: true})
Connection.create({company_id: companies["Kelburn Freight"].id, location_one:"Auckland", location_two: "Wellington", weight_cost: 0, volume_cost: 1, max_weight: 1200, max_volume: 120, duration: 14, frequency: 24, priority:"Land", day: "Thursday", utilised: true})
Connection.create({company_id: companies["Kelburn Freight"].id, location_one:"Hamilton", location_two: "Wellington", weight_cost: 0, volume_cost: 1, max_weight: 1100, max_volume: 130, duration: 10, frequency: 24, priority:"Land", day: "Thursday", utilised: true})
Connection.create({company_id: companies["Rodney's Longhaul"].id, location_one:"Auckland", location_two: "Hamilton", weight_cost: 0, volume_cost: 1, max_weight: 8000, max_volume: 260, duration: 2, frequency: 12, priority:"Land", day: "Monday", utilised: true})
Connection.create({company_id: companies["Roman Air Freight Ltd"].id, location_one:"Sydney", location_two: "Rome", weight_cost: 2, volume_cost: 3, max_weight: 120, max_volume: 140, duration: 12, frequency: 12, priority:"Air", day: "Monday", utilised: true})
Connection.create({company_id: companies["Pacifica Merchants"].id, location_one:"Sydney", location_two: "Suva", weight_cost: 3, volume_cost: 3, max_weight: 100, max_volume: 100, duration: 36, frequency: 168, priority:"Air", day: "Monday", utilised: true})
Connection.create({company_id: companies["Davy Jones Ltd"].id, location_one:"Auckland", location_two: "Rome", weight_cost: 5, volume_cost: 4, max_weight: 1000, max_volume: 1000, duration: 36, frequency: 168, priority:"Land/Seas", day: "Monday", utilised: true})

=begin

Template for adding connections
Connection.create({company_id: companies["XXXXX"].id, location_one:"XXXX", location_two: "XXXXX", weight_cost: X, volume_cost: X, max_weight: XXX, max_volume: XX, duration: XX, frequency: XX, priority:"XXXXX", day: "XXXXX", utilised: true})

=end
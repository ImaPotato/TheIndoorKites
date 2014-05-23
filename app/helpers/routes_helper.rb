module RoutesHelper


	def is_connection_valid?(current, prev)
		if current.location_one == prev.location_one
			return true
		elsif current.location_one == prev.location_two
			return true
		elsif current.location_two == prev.location_one
			return true
		elsif current.location_two == prev.location_two
			return true
		end
		false
	end

	def find_common_location_of_connections(one , two)
		if one.location_one == two.location_one
			return one.location_two
		elsif one.location_one == two.location_two
			return one.location_two
		elsif one.location_two == two.location_one
			return one.location_one
		else one.location_two == two.location_two
			return one.location_one
		end
	end

	def is_connection_valid_given_location?(current , location)
		if current.location_one == location
			return true
		elsif current.location_two == location
			return true
		end
		false
	end

	def is_not_duplicate?(ancestor, connections)
		connections.each do |connection|
			if connection.location_one == ancestor || connection.location_two == ancestor
				return false
			end
		end	
		true
	end

end

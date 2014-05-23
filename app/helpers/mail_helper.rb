module MailHelper

	#I feel dirty after writing this
	def get_locations_from_route (current, final, route)

		locations = Array.new
		found_current = false
		found_final = false
		found_current_first = false
		found_final_first = false
		puts "\n\n\n\n\n\n\n\n\n\n" + current.to_s + " --------------------- " + final.to_s + "\n\n\n\n\n\n\n\n\n"
		route.connections.each do |connection|
			puts "\n\n\n\n\n\n\n\n\n\n" + found_current.to_s + " --------------------- " + found_final.to_s + "\n\n\n\n\n\n\n\n\n"
			
			if found_current == true
				loc = find_common_ancestor locations.last, connection
				locations.push(loc)
				found_final = has_one? final, connection
				if found_final 
					return locations
				end
			elsif found_final == true
				loc = find_common_ancestor locations.last, connection
				locations.push(loc)
				if found_current 
					return locations.reverse
				end
			else
				found_current = has_one? current, connection
				found_final = has_one? final, connection

				if found_final && found_current
					locations.push(current)
					locations.push(final)
					return locations
				end
				if found_current
					locations.push(current)
					locations.push(find_common_ancestor(current,connection))
				end
				if found_final
					locations.push(final)
					locations.push(find_common_ancestor(final,connection))
				end
			end

			return locations
		end

		if found_current && found_final
			if found_current_first
					return locations
				else
					return locations.reverse
			end
		end

	end


	def find_common_ancestor (location, connection)
		if location == connection.location_one
			return connection.location_two
		else
			return connection.location_one
		end
	end


	def find_best_route_and_cost(mail)
		# define map of route id to current vol price  
		# define map of route id to current kg price  
		id_to_vol = Hash.new
		id_to_weight = Hash.new
		

		# define these from mail endpointOne, endpointTwo
		to = mail.to
		from = mail.from
		# get all routes
		Route.all.each do |route|
		# for all routes
			to_found = false
			from_found = false
			id_to_vol[route.id] = 0
			id_to_weight[route.id] = 0

			route.connections.each do |connection|
				#puts "\n\n\n\n\n\ *********" + connection.location_one  + " TO " + connection.location_two 
				#puts "\n\n\n\n\n\ ********* to found:" + 	to_found.to_s + " from_found:"+from_found.to_s
			# for all connections in routes
				if to_found == true && from_found == true
					#puts "ahhh I'm doing nothing now"
					break
					# we'll do nothing
				# check it has both
		
				# check for one
				elsif to_found == true
					# look for from
					from_found = has_one?(from, connection)
					puts "to foundHit!\n\n\n\n\n\ ********* to found:" + 	to_found.to_s + " from_found:"+from_found.to_s
					# if we find endpointOne then mark it as found (somehow)
						id_to_weight[route.id] += connection.weight_cost
						id_to_vol[route.id] += connection.volume_cost	
						# continue looking for the nonmarked node
						# adding the prices of the connections
				elsif from_found == true
					# look for to
					to_found = has_one?(to,connection)
					puts "from found HIt!\n\n\n\n\n\ ********* to found:" + 	to_found.to_s + " from_found:"+from_found.to_s
					# elseif we find endpointTwo then mark it as found (somehow)
						id_to_weight[route.id] += connection.weight_cost
						id_to_vol[route.id] += connection.volume_cost
						# continue looking for the nonmarked node
						# adding the prices of the connections
					# if found both then good i guess. 
				else
					to_found = has_one?(to,connection)
					if to_found == true
						id_to_weight[route.id] += connection.weight_cost
						id_to_vol[route.id] += connection.volume_cost
					end
					from_found = has_one?(from,connection)
					if from_found == true
						id_to_weight[route.id] += connection.weight_cost
						id_to_vol[route.id] += connection.volume_cost
					end
				end
			end
			#puts "\n\n\n\n\n\ ********* to found:" + 	to_found.to_s + " from_found:"+from_found.to_s
			#puts "weightcost " + id_to_weight[route.id].to_s
						#puts "volcost " + id_to_vol[route.id].to_s 
			# we've finshed iterating over the connections
			# if route not found then prices are either -1 or really large
			if to_found == false || from_found == false
				# ruby can't even do max number right.... :(
				id_to_weight[route.id] = 99999999999
				id_to_vol[route.id] = 99999999999
			end
		end
		# find the smallest cost of both maps 
		# best is route of mail.
		volHash = smallest_cost_of_hash(id_to_vol, mail.volume)
		weiHash = smallest_cost_of_hash(id_to_weight, mail.weight)
		volKey, volValue = volHash.first
		weiKey, weiValue = weiHash.first	

		if(volValue >= 99999999999)
			return nil,nil
		end
		if(volValue > weiValue)
			puts "returning cost of " + weiValue.to_s
			return weiKey, weiValue

		elsif(weiValue > volValue) 
			puts "returning cost of " + volValue.to_s
			return volKey, volValue
			# don't forget case of no route found return nil or someting!
		else 
			return volKey,volValue
		end
	end


	def smallest_cost_of_hash(hash_to_check, cost)
		smallest = 99999999999
		smallest_id = -1
		hash_to_check.each do |key, value|
			 if value.to_i < smallest
			 	smallest = value.to_i
			 	smallest_id = key
			 end
		end
		hashish =  Hash.new
		hashish[smallest_id] = smallest * cost
		hashish
	end

	def has_one?(to,connection)
		connection.location_one == to || connection.location_two == to
	end

	def has_both?(to,from,connection)
		has_both = false
		if connection.location_one == to && connection.location_two == from
			has_both = true
		end
		if connection.location_one == from && connection.location_two == to
			has_both = true
		end
		has_both
	end

	def get_mail_price(mail)

		price = Price.last
		volume_cost = 0
		weight_cost = 0

		if mail.priority == 'Air'
			if mail.international == true
				volume_cost = price.i_air_v_cost * mail.volume
				weight_cost = price.i_air_w_cost * mail.weight
			else
				volume_cost = price.d_air_v_cost * mail.volume
				weight_cost = price.d_air_w_cost * mail.weight
			end
		else
			if mail.international == true
				volume_cost = price.i_land_v_cost * mail.volume
				weight_cost = price.i_land_w_cost * mail.weight
			else
				volume_cost = price.d_land_v_cost * mail.volume
				weight_cost = price.d_land_w_cost * mail.weight
			end
		end

		if volume_cost > weight_cost
			return volume_cost
		else
			return weight_cost
		end
	end

end

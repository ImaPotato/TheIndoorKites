module MailHelper


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

end

module GraphHelper


	def get_domestic_expenditure
		Mail.group_by_hour(:created_at).count
	end

	def get_expenditure_but_better
		Mail.group_by_hour(:created_at).where().sum('cost')
	end


	def get_total_revenue
		Mail.group_by_hour(:created_at).sum('price')
	end

	def get_total_number_of_events
		History.group_by_hour(:created_at).count()
	end

	def get_total_volume
		Mail.group_by_hour(:created_at).sum('volume')
	end

	def get_total_weight
		Mail.group_by_hour(:created_at).sum('weight')
	end

	def get_total_number_of_items
		Mail.group_by_hour(:created_at).count()
	end

	def get_critical_routes
		Route.all.map{|route|{name: route.name, data: Mail.where(route_id: route.id).group_by_hour(:created_at).count()}}
	end	

end
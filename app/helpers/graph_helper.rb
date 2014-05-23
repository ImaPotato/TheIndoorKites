module GraphHelper



	def get_domestic_expenditure

		# get all the mail for air priority

		Mail.group_by_hour(:created_at).count

	end

end
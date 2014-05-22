module GraphHelper



def get_expenditure
	Mail.group_by_hour(:created_at).count

end

end
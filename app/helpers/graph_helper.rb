module GraphHelper



def get_expenditure
	Mail.group_by_hour(:created_at).count

end


def get_expenditure_but_better
	Mail.group_by_hour(:created_at).sum('cost')
end

end
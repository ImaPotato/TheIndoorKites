class History < ActiveRecord::Base
	belongs_to :companies
	belongs_to :locations
	belongs_to :connections
	belongs_to :prices
	belongs_to :mail


	def get_event_description(event,action)
		eventDescription = ""
		case event.class.name
	      when "Company"
	      	company = Company.find(self.company_id)
	        eventDescription = "%s Company %s " % [action,company.company_name]
	      when "Mail"
	        mail = Mail.find(self.mail_id)
	        eventDescription = "%s Mail with Tracking Id: %s" % [action,mail[:id]]
	      when "Connection"
	      	# get the connection and the company who owns it
	      	connection = Connection.find(self.connection_id)
	      	company = Company.find(connection[:company_id])
	        eventDescription= "%s %s Connection:%s-%s" % [action,company.company_name,connection.location_one, connection.location_two]
	      when "Location"
	      	location = Location.find(self.location_id)
	        eventDescription = "%s KPS Distribution Centre %s" % [action,location[:name]]
	      when "Price"
	        eventDescription  = "%s Pricing" % [action]
	      else
	      	eventDescription = "No Event Description Avaliable"
      	end
      	eventDescription
	end


	def get_detailed_description()
		if self.nil?
			return "No event Description Avaliable"
		case :event_type
	      when "Company"
	      	if self.company_id.nil?
	      		return "No event Description Avaliable"	
	      	end
	      	company = Company.find(self.company_id)
	      when "Mail"
	      	if self.mail_id.nil?
	      		return "No event description avaliable"
	      	end
	        mail = Mail.find(self.mail_id)
	        eventDescription = "%s Mail with Tracking Id: %s" % [action,mail[:id]]
	      when "Connection"
	      	# get the connection and the company who owns it
	      	connection = Connection.find(self.connection_id)
	      	if self.nil? && self.connection_id.nil?
	      		return "No Event Description Avaliable"
	      	end
		    company = Company.find(connection[:company_id])
		    eventDescription= "%s %s Connection:%s-%s" % [action,company.company_name,connection.location_one, connection.location_two]
	      when "Location"
	      	if self.nil? && self.location_id.nil?
	      		return "No Event Description Avaliable"
	      	end
	      	location = Location.find(self.location_id)
	        eventDescription = "%s KPS Distribution Centre %s" % [action,location[:name]]
	      when "Price"
	        eventDescription  = "%s Pricing" % [action]
	      else
	      	eventDescription = "No Event Description Avaliable"
      	end
	end
end

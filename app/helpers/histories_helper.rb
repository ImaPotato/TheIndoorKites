module HistoriesHelper
	

	HISTORY_EVENT_CREATED = "Created"
    HISTORY_EVENT_UPDATED = "Updated"
    HISTORY_EVENT_DELETED = "Deleted"
    HISTORY_EVENT_MAIL_DELIVERED = "Delivered"

	def string_for_event_time(event_time)
		return event_time.strftime("%I:%M%p on %m/%d/%y")
	end

	def path_for_event(event)
		event_path = "root"
		case event.event_type
	      when "Company"
	        event_path = company_path(event.company_id)
	      when "Mail"
	        event_path = mail_path(event.mail_id)
	      when "Connection"
	        event_path = connection_path(event.connection_id)
	      when "Location"
	        event_path = location_path(event.location_id)
	      when "Price"
	        event_path = price_path(event.price_id)
	    end
	    event_path
	end

end
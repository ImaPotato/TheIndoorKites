module HistoriesHelper
	

	HISTORY_EVENT_CREATED = "Created"
    HISTORY_EVENT_UPDATED = "Updated"
    HISTORY_EVENT_DELETED = "Deleted"
    HISTORY_EVENT_MAIL_DELIVERED = "Delivered"

	def string_for_event_time(event_time)
		return event_time.strftime("%I:%M%p on %m/%d/%y")
	end

end
json.array!(@mail) do |mail|
  json.extract! mail, :id, :to, :from, :day, :weight, :volume, :priority, :send_date, :receive_date, :max_delivery_time, :cost, :current_location
  json.url mail_url(mail, format: :json)
end

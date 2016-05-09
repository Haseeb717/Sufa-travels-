json.array!(@transport_expenditures) do |transport_expenditure|
  json.extract! transport_expenditure, :id, :transport_type, :expenditure_type, :no_of_seats, :arrival_time, :departure_time, :arrival_place, :departure_place, :payment, :user_id
  json.url transport_expenditure_url(transport_expenditure, format: :json)
end

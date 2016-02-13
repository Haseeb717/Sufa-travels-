json.array!(@hotel_expenditures) do |hotel_expenditure|
  json.extract! hotel_expenditure, :id, :expenditure_type, :checked_in_date, :checked_out_date, :total_days, :charges_per_day, :no_of_rooms, :room_type, :total_amount, :hotel_name, :user_id, :comments
  json.url hotel_expenditure_url(hotel_expenditure, format: :json)
end

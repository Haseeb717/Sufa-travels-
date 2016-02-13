json.array!(@food_expenditures) do |food_expenditure|
  json.extract! food_expenditure, :id, :food_type, :expenditure_type, :hotel_name, :payment, :no_of_persons
  json.url food_expenditure_url(food_expenditure, format: :json)
end

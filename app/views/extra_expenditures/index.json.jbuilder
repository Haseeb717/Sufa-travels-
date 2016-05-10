json.array!(@extra_expenditures) do |extra_expenditure|
  json.extract! extra_expenditure, :id, :payment, :expenditure_type, :user_id, :reason
  json.url extra_expenditure_url(extra_expenditure, format: :json)
end

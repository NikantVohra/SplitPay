json.array!(@expenses) do |expense|
  json.extract! expense, :id, :category, :amount
  json.url expense_url(expense, format: :json)
end

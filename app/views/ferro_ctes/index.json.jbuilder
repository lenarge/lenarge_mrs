json.array!(@ferro_ctes) do |ferro_cte|
  json.extract! ferro_cte, :id, :number, :series, :weight
  json.url ferro_cte_url(ferro_cte, format: :json)
end

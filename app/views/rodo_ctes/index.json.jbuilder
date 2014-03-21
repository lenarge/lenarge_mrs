json.array!(@rodo_ctes) do |rodo_cte|
  json.extract! rodo_cte, :id, :number, :emitted_at, :series, :amount, :weight, :cnpj
  json.url rodo_cte_url(rodo_cte, format: :json)
end

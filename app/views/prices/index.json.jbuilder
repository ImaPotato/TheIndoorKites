json.array!(@prices) do |price|
  json.extract! price, :id, :i_air_w_cost, :i_air_v_cost, :i_land_w_cost, :i_land_v_cost, :d_air_w_cost, :d_air_v_cost, :d_land_w_cost, :d_land_v_cost
  json.url price_url(price, format: :json)
end

class Price < ActiveRecord::Base
 validates :i_air_w_cost,:i_air_v_cost,:i_land_w_cost,:i_land_v_cost,:d_air_w_cost,:d_air_v_cost, :d_land_w_cost, :d_land_v_cost, numericality: true

 has_many :histories
end


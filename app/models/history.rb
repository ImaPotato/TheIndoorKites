class History < ActiveRecord::Base
	belongs_to :companies
	belongs_to :locations
	belongs_to :connections
	belongs_to :prices
	belongs_to :mail

end

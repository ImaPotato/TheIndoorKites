class Location < ActiveRecord::Base
  #belongs_to :connection
  has_many :histories
end

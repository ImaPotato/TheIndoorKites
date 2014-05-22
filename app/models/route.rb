class Route < ActiveRecord::Base
  has_and_belongs_to_many :connections
  accepts_nested_attributes_for :connections
end

class Route < ActiveRecord::Base
  has_and_belongs_to_many :connections
  has_many :mails
  accepts_nested_attributes_for :connections
  accepts_nested_attributes_for :mails
end

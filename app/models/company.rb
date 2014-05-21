class Company < ActiveRecord::Base
  has_many :connections, :dependent => :destroy 
  has_many :histories

  accepts_nested_attributes_for :connections, allow_destroy: true, :reject_if => :all_blank
  accepts_nested_attributes_for :histories
end

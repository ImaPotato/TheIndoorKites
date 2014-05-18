class Company < ActiveRecord::Base
  has_many :connections, :dependent => :destroy

  accepts_nested_attributes_for :connections, allow_destroy: true, :reject_if => :all_blank

end

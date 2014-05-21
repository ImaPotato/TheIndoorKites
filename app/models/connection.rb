class Connection < ActiveRecord::Base
  belongs_to :company

  #has_many :locations, :dependent => :destroy
  has_many :histories
  #accepts_nested_attributes_for :locations, allow_destroy: true
end

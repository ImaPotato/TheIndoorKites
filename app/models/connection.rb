class Connection < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :routes

  #has_many :locations, :dependent => :destroy
  has_many :histories
  #accepts_nested_attributes_for :locations, allow_destroy: true

  #validates :location_one, presence: true, if: :send_date

  #validates :location_one, :if => :send_date?

end

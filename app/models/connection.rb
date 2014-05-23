class Connection < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :routes

  #has_many :locations, :dependent => :destroy
  has_many :histories
  #accepts_nested_attributes_for :locations, allow_destroy: true


  def name_with_locations
    "#{self.location_one} - #{self.location_two} #{self.priority}"
  end

end

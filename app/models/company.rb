class Company < ActiveRecord::Base
  has_many :company_histories

  validates :company, presence: true
  validates :to, presence: true
  validates :from, presence: true
  validates :priority, presence: true

  validates_numericality_of :weight_cost
  validates_numericality_of :volume_cost
  validates_numericality_of :max_weight
  validates_numericality_of :max_volume

  #before_save :check_for_errors

  def self.search(search)
    if search
      where('lower(company) LIKE ?', "#{search.downcase}%")
    else
      where(nil)
    end
  end

  def check_for_errors
    if :weight_cost.nil? and :volume_cost.nil?
      puts 'error' #change this to an actual error
    elsif :max_weight.nil? and :volume_cost.nil?
      puts 'error' #same here
    elsif :max_volume.nil? and :weight_cost.nil?
      puts 'error' #you no the drill
    end
  end
end

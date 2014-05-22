class Mail < ActiveRecord::Base
	has_many :histories

	#validates_numericality_of :weight, :volume, on: :create
	validates :sender, :receiver, presence: true
	validates :to, :from, presence: true
	validates :weight, :volume, :numericality => { :greater_than_or_equal_to => 0 }
	validates :priority, presence: true

	#validates_date :send_date
	#validates_date :send_date, :less_than_or_equal_to => :max_delivery_date
end

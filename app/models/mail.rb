class Mail < ActiveRecord::Base
	has_many :histories
	belongs_to :route
	validates_numericality_of :weight, :volume, on: :create
end

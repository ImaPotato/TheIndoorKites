class Mail < ActiveRecord::Base
	has_many :histories

	validates_numericality_of :weight, :volume, on: :create

end

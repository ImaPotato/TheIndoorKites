class Mail < ActiveRecord::Base

validates_numericality_of :weight, :volume, on: :create

end

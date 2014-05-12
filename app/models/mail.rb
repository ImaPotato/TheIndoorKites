class Mail < ActiveRecord::Base
  has_many :mail_histories
end

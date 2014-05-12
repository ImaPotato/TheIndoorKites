class Company < ActiveRecord::Base
  has_many :company_histories_histories

  def self.search(search)
    if search
      where('lower(company) LIKE ?', "#{search.downcase}%")
    else
      where(nil)
    end
  end
end

class Product < ActiveRecord::Base

  has_many :offerings
  has_many :markets, through: :offerings

end

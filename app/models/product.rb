class Product < ActiveRecord::Base
  validates_presence_of :name

  has_many :offerings
  has_many :markets, through: :offerings

end

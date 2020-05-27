class Pay < ApplicationRecord
  belongs_to :user
  has_one :pay_category
  validates :price, presence:true
  validates :price, numericality: { greater_than: -1000000000, less_than: 0 }   

end
 
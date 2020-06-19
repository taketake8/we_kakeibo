class Pay < ApplicationRecord
  belongs_to :user
  belongs_to :pay_category, optional: true
  validates :price,:start_time, presence:true
  validates :price, numericality: { greater_than: -1000000000, less_than: 0 }   
end
 
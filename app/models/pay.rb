class Pay < ApplicationRecord
  belongs_to :user
  validates :price, presence:true
  validates :price, numericality: { greater_than: -1000000000, less_than: 0 }   

end
 
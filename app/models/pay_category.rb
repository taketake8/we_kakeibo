class PayCategory < ApplicationRecord
  belongs_to :user
  belongs_to  :pay
end

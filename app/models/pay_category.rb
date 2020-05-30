class PayCategory < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to  :pay, optional: true
end

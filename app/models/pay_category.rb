class PayCategory < ApplicationRecord
  belongs_to :user, optional: true
  has_many :pays,dependent: :nullify
end

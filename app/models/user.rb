class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pays
  has_one :pay_category
  validates :nickname, :age, presence:true
  validates :nickname,  uniqueness: true
  validates :nickname, length: { maximum: 8 }

end

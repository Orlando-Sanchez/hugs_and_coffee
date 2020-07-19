class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  has_many :multipliers
  accepts_nested_attributes_for :multipliers
  validates :user, presence: true
  validates :fullname, :occupation, :biography, :coffee_price, :currency_sign, presence: true
end

class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :weight ,:weight_type ,:quantity ,presence: :true
end

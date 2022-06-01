class Shoe < ApplicationRecord
  has_one_attached :shoeImage
  #belongs_to :user
end

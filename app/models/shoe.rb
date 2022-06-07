class Shoe < ApplicationRecord

  has_one_attached :shoeImage
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  enum status: { public: 0, private: 1 }, _prefix: true

end

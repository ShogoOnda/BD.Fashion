class Tag < ApplicationRecord
    has_many :post_tags, dependent: :destroy
    has_many :outers, through: :post_tags
    has_many :inners, through: :post_tags
    has_many :bottoms, through: :post_tags
    has_many :shoes, through: :post_tags
end

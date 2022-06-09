class Oneday < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
    belongs_to :user
    has_many :onedays, dependent: :destroy
    has_many :outers, through: :post_onedays, dependent: :destroy
    has_many :inners, through: :post_onedays, dependent: :destroy
    has_many :bottoms, through: :post_onedays, dependent: :destroy
    has_many :shoes, through: :post_onedays
end

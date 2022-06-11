class Shoecomment < ApplicationRecord
  validates :body, presence: true  #追加
  belongs_to :user
  belongs_to :shoe
end

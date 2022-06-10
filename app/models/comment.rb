class Comment < ApplicationRecord
  validates :body, presence: true  #追加
  belongs_to :user
  belongs_to :outer
  belongs_to :inner
  belongs_to :bottom
  belongs_to :shoe
end

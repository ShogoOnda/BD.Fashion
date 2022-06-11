class Outercomment < ApplicationRecord
  validates :body, presence: true  #追加
  belongs_to :user
  belongs_to :outer
end

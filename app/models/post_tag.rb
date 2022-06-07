class PostTag < ApplicationRecord
  belongs_to :outer
  belongs_to :inner
  belongs_to :bottom
  belongs_to :shoe
  belongs_to :tag
end

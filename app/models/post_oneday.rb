class PostOneday < ApplicationRecord
  belongs_to :outer, optional: true
  belongs_to :inner, optional: true
  belongs_to :bottom, optional: true
  belongs_to :shoe, optional: true
  belongs_to :oneday, optional: true
end

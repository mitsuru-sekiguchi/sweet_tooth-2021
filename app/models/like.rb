class Like < ApplicationRecord
  belongs_to :user
  belongs_to :sweet
  # validates_uniqueness_of :sweet_id, scope: :user_id
end

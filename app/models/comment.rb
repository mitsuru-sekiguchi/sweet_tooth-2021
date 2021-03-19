class Comment < ApplicationRecord
  belongs_to :sweet
  belongs_to :user
end

class Comment < ApplicationRecord
  belongs_to :sweet
  belongs_to :user

  validates :text, presence: true
end

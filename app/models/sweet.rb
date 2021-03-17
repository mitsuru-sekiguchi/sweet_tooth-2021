class Sweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
   validates :name
   validates :price
   validates :shop_info
   validates :image
 end
end

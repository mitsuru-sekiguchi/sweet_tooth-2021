class Sweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price, format: { with: /([0-9].*[0-9])/ }
    validates :shop_info
    validates :image
  end
end

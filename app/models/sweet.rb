class Sweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price, format: { with: /([0-9].*[0-9])/ }
    validates :shop_info
    validates :image
  end

  def self.search(search)
    if search != ''
      Sweet.where('name LIKE(?)', "%#{search}%")
    else
      Sweet.all
    end
  end
end

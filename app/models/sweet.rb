class Sweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price, format: { with: /([0-9].*[0-9])/ }
    validates :shop_info
    validates :image, unless: :was_attached?
  end

  def image_content_type
    extension = ['image/png', 'image/jpg', 'image/jpeg']
  end

  def was_attached?
    self.image.attached?
  end

  def self.search(search)
    if search != ''
      Sweet.where('name LIKE(?)', "%#{search}%")
    else
      Sweet.all
    end
  end
end

class Product < ApplicationRecord

  belongs_to :brand
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  validates :name, presence: true, uniqueness: true
  validates :brand, presence: true
  validates :cost_price, presence: true
  validates :selling_price, presence: true
  validates :stock, presence: true

  # Return main image
  def main_image_url
    images.find_by_position(1).try(:url)
  end

  # Return all the images in ascending position order
  def all_images
    images.order(position: :asc)
  end

  # Save image to product
  def add_image(url)
    return unless url
    position = self.images.maximum(:position).try(:next) || 1
    self.images.create(url: url, position: position)
  end

  # Order images properly based on their :position
  def order_images
    all_images.each.with_index(1) do |image, idx|
      image.update(position: idx)
    end
  end

end

class Product < ApplicationRecord

  belongs_to :brand
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :images
  accepts_nested_attributes_for :images

  validates :name, presence: true, uniqueness: true
  validates :brand, presence: true
  validates :cost_price, presence: true
  validates :selling_price, presence: true
  validates :stock, presence: true

  # Return url of main image
  def main_image
    images.find_by_position(1).try(:url) || ''
  end

  # Return an array of urls for the images
  def all_image
    images.map(&:url)
  end

  def add_image(url)
    return unless url
    position = self.images.maximum(:position).try(:next) || 1
    self.images.create(url: url, position: position)
  end

end

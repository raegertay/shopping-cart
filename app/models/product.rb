class Product < ApplicationRecord

  belongs_to :brand
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, presence: true, uniqueness: true
  validates :brand, presence: true
  validates :cost_price, presence: true
  validates :selling_price, presence: true
  validates :stock, presence: true

end

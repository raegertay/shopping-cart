class Category < ApplicationRecord

  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories

  validates :name, presence: true, uniqueness: true

  def self.options_for_select
    order("LOWER(name)")
  end

end

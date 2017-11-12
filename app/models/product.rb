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

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_brand_id
    ]
  )

  scope :sorted_by, ->(sort_option) {
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'

    case sort_option.to_s
    when /^created_at_/
      order("created_at #{direction}")
    when /^selling_price_/
      order("selling_price #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  scope :search_query, ->(query) {
    return nil if query.blank?

    terms = query.split(/\s+/)

    terms = terms.map do |term|
      ('%' + term.gsub('*', '%') + '%').gsub(/%+/, '%')
    end

    where(
      terms.map do |term|
        "name ILIKE ?"
      end.join(' AND '), *terms
    )
  }

  scope :with_brand_id, ->(brand_ids) {
    where(brand_id: [*brand_ids])
  }

  def self.options_for_sorted_by
    [
      ['Newest', 'created_at_desc'],
      ['Price: Low to High', 'selling_price_asc'],
      ['Price: High to Low', 'selling_price_desc'],
    ]
  end

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

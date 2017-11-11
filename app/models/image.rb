class Image < ApplicationRecord

  belongs_to :product

  validates :url, presence: true
  validates :position, presence: true

end

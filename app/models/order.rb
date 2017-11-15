class Order < ApplicationRecord

  enum status: [:in_progress, :delivered]

  belongs_to :customer
  belongs_to :product
  has_many :order_items, dependent: :destroy

  validates :status, presence: true

end

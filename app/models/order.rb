class Order < ApplicationRecord

  enum status: [:in_progress, :delivered, :refund]

  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :status, presence: true

end

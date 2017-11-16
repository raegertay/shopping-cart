class Order < ApplicationRecord

  enum status: [:in_progress, :delivered, :refund]

  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :status, presence: true

  def total_price
    self.order_items.reduce(0) do |sum, order_item|
      sum += order_item.unit_price * order_item.quantity
    end
  end

end

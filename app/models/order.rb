class Order < ApplicationRecord

  enum status: [:in_progress, :delivered]

  belongs_to :customer

  validates :status, presence: true

end

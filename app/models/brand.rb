class Brand < ApplicationRecord
  has_many :products
  validates :name, presence: true, uniqueness: true

  def self.options_for_select
    order("LOWER(name)").map{ |e| [e.name, e.id] }
  end

end

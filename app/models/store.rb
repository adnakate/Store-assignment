class Store < ApplicationRecord
  enum status: { disabled: 0, enabled: 1 }
  # enum color: %w(blue red yellow black)
  validates :type,
            :name,
            :product_price,
            :status,
            :inward_date,
            :description, presence: true

  def self.price_sum(type)
    where(type: type).sum(:product_price)
  end
end

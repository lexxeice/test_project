class Product < ApplicationRecord

  validates :title, presence: true, length: { maximum: 50 }

  validates :description, presence: true, length: { maximum: 300 }

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

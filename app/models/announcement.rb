class Announcement < ApplicationRecord
  belongs_to :member
  belongs_to :category

  monetize :price_cents

  validates :title, :description, :category, :member, :finish_date, presence: true
  validates :price, numericality: { greater_than: 0 }
end

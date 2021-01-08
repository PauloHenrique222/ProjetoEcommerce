class Announcement < ApplicationRecord
  belongs_to :member
  belongs_to :category
  has_many :comments

  monetize :price_cents

  mount_uploader :image, ImageUploader

  validates :title, :description, :category, :member, :finish_date, presence: true
  validates :price, numericality: { greater_than: 0 }
end

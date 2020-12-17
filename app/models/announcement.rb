class Announcement < ApplicationRecord
  belongs_to :member
  belongs_to :category

  monetize :price_cents
end

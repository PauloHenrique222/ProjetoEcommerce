class Category < ApplicationRecord

  include FriendlyId
  friendly_id :description, use: :slugged

  validates_presence_of :description

  has_many :announcements

end

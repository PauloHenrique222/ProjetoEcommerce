class AddPriceCentsToAnnouncements < ActiveRecord::Migration[5.2]
  def change
    add_column :announcements, :price_cents, :integer
  end
end

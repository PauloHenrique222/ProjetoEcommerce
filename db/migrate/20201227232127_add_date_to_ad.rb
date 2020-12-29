class AddDateToAd < ActiveRecord::Migration[5.2]
  def change
    add_column :announcements, :finish_date, :date
  end
end

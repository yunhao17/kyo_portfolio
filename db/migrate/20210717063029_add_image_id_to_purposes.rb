class AddImageIdToPurposes < ActiveRecord::Migration[5.2]
  def change
    add_column :purposes, :image_id, :string
  end
end

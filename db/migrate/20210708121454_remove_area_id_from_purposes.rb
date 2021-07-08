class RemoveAreaIdFromPurposes < ActiveRecord::Migration[5.2]
  def change
    remove_column :purposes, :area_id, :integer
  end
end

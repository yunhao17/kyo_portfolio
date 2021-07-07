class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.integer :area_id
      t.integer :purpose_id
      t.string :image_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

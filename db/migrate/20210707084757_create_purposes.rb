class CreatePurposes < ActiveRecord::Migration[5.2]
  def change
    create_table :purposes do |t|
      t.integer :area_id
      t.string :name

      t.timestamps
    end
  end
end

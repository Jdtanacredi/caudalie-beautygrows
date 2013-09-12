class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :instagram_id
      t.string :standard_url
      t.string :thumb_url
      t.boolean :approved

      t.timestamps
    end
  end
end

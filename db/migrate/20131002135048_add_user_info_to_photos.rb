class AddUserInfoToPhotos < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.string :caption_text
      t.string :user_username
      t.string :user_full_name
      t.string :user_profile_picture
    end
  end
end

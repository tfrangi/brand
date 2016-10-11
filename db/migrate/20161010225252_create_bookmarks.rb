class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      
      t.string :g_id
      t.string :url
      t.string :html_url

      t.integer :user_id

      t.foreign_key :users
      t.timestamps
    end
  end
end

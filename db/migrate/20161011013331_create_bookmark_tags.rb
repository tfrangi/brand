class CreateBookmarkTags < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks_tags, id: false do |t|
      t.integer :bookmark_id
      t.integer :tag_id

      t.index :bookmark_id
      t.index :tag_id

      t.foreign_key :bookmarks
      t.foreign_key :tags
    end
  end
end

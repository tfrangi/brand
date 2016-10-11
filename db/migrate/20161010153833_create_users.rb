class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :g_id
      t.string :url
      t.string :html_url
      t.string :gists_url
      t.text :bio

      t.timestamps
    end
  end
end

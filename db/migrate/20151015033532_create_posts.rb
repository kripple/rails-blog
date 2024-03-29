class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false, unique: true
      t.string :date, null: false
      t.text :description, null: false
      t.text :body, null: false
      t.boolean :published
      t.string :slug, null: false, index: true

      t.timestamps null: false
    end
  end
end

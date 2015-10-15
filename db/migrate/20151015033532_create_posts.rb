class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false, unique: true
      t.string :date, null: false
      t.text :blurb, null: false
      t.text :body, null: false
      t.boolean :published, null: false
      t.string :slug, null: false

      t.timestamps null: false
    end
  end
end

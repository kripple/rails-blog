class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :date
      t.text :blurb
      t.text :body
      t.boolean :published
      t.references :user

      t.timestamps null: false
    end
  end
end

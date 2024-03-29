class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, null: false, unique: true
      t.string :description, null: false
      t.string :url, null: false, unique: true
      t.string :source
      t.boolean :published
      t.string :slug, null: false, index: true

      t.timestamps null: false
    end
  end
end

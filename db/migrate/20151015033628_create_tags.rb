class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null: false, unique: true
      t.string :slug, null: false, index: true
      t.references :post, index: true
      t.references :project, index: true

      t.timestamps null: false
    end
  end
end

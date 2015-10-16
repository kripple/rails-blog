class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null: false, unique: true
      t.references :taggable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end

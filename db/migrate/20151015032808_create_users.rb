class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, unique: true
      t.string :password_digest
      t.text :about, null: false

      t.timestamps null: false
    end
  end
end

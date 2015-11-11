class AddDateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :date, :string, null: false
  end
end

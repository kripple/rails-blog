class AddValidationsToProjectDate < ActiveRecord::Migration
  def change
  	change_column_null :project, :date, false
  end
end

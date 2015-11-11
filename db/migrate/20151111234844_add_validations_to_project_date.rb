class AddValidationsToProjectDate < ActiveRecord::Migration
  def change
  	change_column_null :projects, :date, false
  end
end

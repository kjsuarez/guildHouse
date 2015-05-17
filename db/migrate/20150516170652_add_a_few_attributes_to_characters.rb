class AddAFewAttributesToCharacters < ActiveRecord::Migration
  def change
  	add_column :characters, :hit_points, :integer
  	add_column :characters, :level_table, :text
  	add_column :characters, :class_skills, :string
  end
end

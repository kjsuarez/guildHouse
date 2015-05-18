class AddSkillSetToCharacters < ActiveRecord::Migration
  def change
  	add_column :characters, :skill_set, :text
  end
end

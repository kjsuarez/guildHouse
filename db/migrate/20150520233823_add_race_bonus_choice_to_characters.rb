class AddRaceBonusChoiceToCharacters < ActiveRecord::Migration
  def change
  	add_column :characters, :race_bonus_choice, :string
  end
end

class ChangeHpInMonsterData < ActiveRecord::Migration
  def up
    remove_column :monsters, :hp
    add_column :monsters, :hit_points, :integer
  end

  def down
    add_column :monsters, :hp, :integer
    remove_column :monsters, :hit_points
  end
end

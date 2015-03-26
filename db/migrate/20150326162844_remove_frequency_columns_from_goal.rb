class RemoveFrequencyColumnsFromGoal < ActiveRecord::Migration
  def change
    remove_column :goals, :frequency
    remove_column :goals, :frequency_type
  end
end

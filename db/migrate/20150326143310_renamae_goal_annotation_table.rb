class RenamaeGoalAnnotationTable < ActiveRecord::Migration
  def self.up
    rename_table :goal_annotations, :goal_history_annotations
  end
  def self.down
    rename_table :goal_history_annotations, :goal_annotations
  end
end

class RenamaeAnnotationTable < ActiveRecord::Migration
  def self.up
    rename_table :annotations, :goal_annotations
  end
  def self.down
    rename_table :goal_annotations, :annotations
  end
end

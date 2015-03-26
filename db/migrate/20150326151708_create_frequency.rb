class CreateFrequency < ActiveRecord::Migration
  def self.up
    create_table :goal_frequencies do |t|
      t.string :value
      t.belongs_to :goal
      t.string :type
    end
  end
  def self.down
    drop_table :goal_frequencies
  end
end

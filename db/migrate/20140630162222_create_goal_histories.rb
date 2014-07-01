class CreateGoalHistories < ActiveRecord::Migration
  def change
    create_table :goal_histories do |t|
      t.date :date
      t.boolean :response
      t.belongs_to :goal

      t.timestamps
    end
  end
end

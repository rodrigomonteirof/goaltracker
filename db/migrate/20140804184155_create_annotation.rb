class CreateAnnotation < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.text :text
      t.belongs_to :goal_history

      t.timestamps
    end
  end
end

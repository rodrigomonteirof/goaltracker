class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.time :alarm_hour
      t.integer :frequency
      t.text :frequency_type
      t.date :until_date
      t.belongs_to :user

      t.timestamps
    end
  end
end

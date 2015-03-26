class GoalAnnotation < ActiveRecord::Base
  belongs_to :goal_history

  validates :text,  presence: true
end

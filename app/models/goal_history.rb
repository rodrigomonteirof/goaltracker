class GoalHistory < ActiveRecord::Base
  belongs_to :goal
  has_one :annotation, class: GoalHistoryAnnotation
end

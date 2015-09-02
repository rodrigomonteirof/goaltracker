class Goal::History < ActiveRecord::Base
  belongs_to :goal
  has_one :annotation, class: Goal::History::Annotation
end

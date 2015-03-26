class GoalFrequency < ActiveRecord::Base
  belongs_to :goal

  def filter_dates(dates)
    dates
  end
end

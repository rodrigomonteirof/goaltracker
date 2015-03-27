class GoalFrequency < ActiveRecord::Base
  belongs_to :goal

  def filter_dates(dates)
    dates
  end

  def parse_value
    value.scan(/[0-9]/).map(&:to_i)
  end
end

class GoalFrequency < ActiveRecord::Base
  belongs_to :goal

  def filter_dates(dates)
    dates
  end

  def parse_value
    value.scan(/\d*(?:\.\d+)?/).reject!(&:empty?).map(&:to_i)
  end
end

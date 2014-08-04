class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :goal_histories

  validates :name,        presence: true, length: { in: 4..20 }
  validates :start_date,  presence: true
  validates :alarm_hour,  presence: true
  validates :frequency,   presence: true, numericality: { only_integer: true }

  def available_days(date_limit)
    dates = Array.new

    for i in 1..date_limit.day
      date = Date.new(date_limit.year, date_limit.month, i)
      if weekdays.include? date.wday
        dates << date
      end
    end

    dates
  end

  def weekdays
    [1,2,3,4,5]
  end

end

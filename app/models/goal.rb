class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :goal_histories

  validates :name,        presence: true, length: { in: 4..20 }
  validates :start_date,  presence: true
  validates :alarm_hour,  presence: true
  validates :frequency,   presence: true, numericality: { only_integer: true }

  def available_days(date = nil)
    dates = Array.new
    date_limit = date_limit(date)

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

  def date_limit(date)
    if date.present?
      date_limit = Date.parse(date)
    end

    if date_limit.blank? or date_limit >= Date.today.end_of_month
      date_limit = Date.today
    end

    date_limit
  end

end

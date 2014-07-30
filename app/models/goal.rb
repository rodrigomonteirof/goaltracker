class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :goal_histories

  validates :name,        presence: true, length: { in: 4..20 }
  validates :start_date,  presence: true
  validates :alarm_hour,  presence: true
  validates :frequency,   presence: true, numericality: { only_integer: true }

  def send_alarm
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@ Goal.send_alarm called"
  end

  def available_days(date_limit)
    dates = Array.new

    for i in 1..date_limit.day
      date = Date.new(date_limit.year, date_limit.month, i)
      dates << date
    end

    dates
  end

  def remove
  end

end

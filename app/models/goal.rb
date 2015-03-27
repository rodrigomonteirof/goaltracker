class Goal < ActiveRecord::Base
  extend SimpleCalendar

  belongs_to :user
  has_many :histories, class_name: GoalHistory
  has_one :frequency, class_name: GoalFrequency

  validates :name,        presence: true, length: { in: 4..20 }

  def available_days(date = nil)
    dates = []
    date_limit = date_limit(date)

    date_limit.day.times do |day|
      dates << Date.new(date_limit.year, date_limit.month, day + 1)
    end

    frequency.filter_dates(dates)
  end

  def date_limit(date)
    date_limit = Date.parse(date) if date.present?

    if date_limit.blank? || date_limit >= Date.today.end_of_month
      date_limit = Date.today
    end

    date_limit
  end
end

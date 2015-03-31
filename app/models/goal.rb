class Goal < ActiveRecord::Base
  extend SimpleCalendar

  belongs_to :user
  has_many :histories, class_name: GoalHistory
  has_one :frequency, class_name: GoalFrequency

  validates :name,        presence: true, length: { in: 4..20 }

  def available_days(date = nil)
    dates = []
    date = date_limit(date)

    date.day.times do |day|
      dates << Date.new(date.year, date.month, day + 1)
    end

    frequency.filter_dates(dates)
  end

  def date_limit(date)
    limit = Date.parse(date) if date.present?
    limit = Date.today if limit.blank? || limit >= Date.today.end_of_month

    limit
  end
end

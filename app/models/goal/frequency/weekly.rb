class Goal::Frequency::Weekly < Goal::Frequency
  def filter_dates(dates)
    allowed_dates = []

    dates.each do |date|
      allowed_dates << date if parse_value.include?(date.wday)
    end

    allowed_dates
  end
end

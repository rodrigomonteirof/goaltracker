class Goal::Frequency::Monthly < Goal::Frequency
  def filter_dates(dates)
    allowed_dates = []

    dates.each do |date|
      allowed_dates << date if parse_value.include?(date.day)
    end

    allowed_dates
  end
end

module GoalsHelper
  def calendar(date = Date.Today, &block)
    Calendar.new(self, date, block).table
  end
end

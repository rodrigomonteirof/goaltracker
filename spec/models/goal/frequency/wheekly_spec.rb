require 'rails_helper'

describe GoalFrequencyWeekly do
  let(:monday) { Date.parse('2015-03-16') }
  let(:tuesday) { Date.parse('2015-03-17') }
  let(:wednesday) { Date.parse('2015-03-18') }
  let(:thursday) { Date.parse('2015-03-19') }
  let(:friday) { Date.parse('2015-03-20') }
  let(:saturday) { Date.parse('2015-03-21') }
  let(:sunday) { Date.parse('2015-03-22') }

  let(:weekday) { [monday, tuesday, wednesday, thursday, friday] }
  let(:week) {
    [monday, tuesday, wednesday, thursday, friday, saturday, sunday]
  }

  describe '#filter_dates' do
    subject { described_class.new(value: '[1,2,3,4,5]').filter_dates(week) }

    it 'remove weekend' do
      is_expected.to eq(weekday)
    end
  end
end

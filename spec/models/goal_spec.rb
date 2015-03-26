require 'rails_helper'

describe Goal do
  describe '#date_limit' do
    subject { described_class.new.date_limit(date) }

    context 'when date is nil' do
      let(:date) { nil }

      it 'return the current date' do
        is_expected.to eq(Date.today)
      end
    end

    context 'when is a future date' do
      let(:date) { Date.new(Date.today.year + 1).to_s }

      it 'return the current date' do
        is_expected.to eq(Date.today)
      end
    end

    context 'when is a past date' do
      let(:date) { '1987-04-14' }

      it 'return the same date' do
        is_expected.to eq(Date.parse(date))
      end
    end
  end

  describe '#available_days' do
    subject { described_class.new(frequency: frequency).available_days(date) }
    let(:date) { '2015-03-02' }
    let(:frequency) { GoalFrequency.new }

    it 'return days of month until today' do
      is_expected.to eq([Date.parse('2015-03-01'), Date.parse('2015-03-02')])
    end
  end
end

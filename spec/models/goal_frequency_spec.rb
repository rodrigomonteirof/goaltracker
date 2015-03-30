require 'rails_helper'

describe GoalFrequency do
  describe '#filter_dates' do
    subject { described_class.new.filter_dates(dates) }
    let(:dates) { [Date.today] }

    it { is_expected.to eq(dates) }
  end

  describe '#parse_value' do
    subject { described_class.new(value: value).parse_value }
    let(:value) { '[1,15,30]' }

    it { is_expected.to eq ([1,15,30]) }
  end
end

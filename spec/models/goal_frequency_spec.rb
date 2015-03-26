require 'rails_helper'

describe GoalFrequency do
  describe '#filter_dates' do
    subject { described_class.new.filter_dates(dates) }
    let(:dates) { [Date.today] }

    it { is_expected.to eq(dates) }
  end
end

require 'rails_helper'

describe Goal::Frequency::Monthly do
  let(:d1) { Date.parse('2015-03-01') }
  let(:d2) { Date.parse('2015-03-02') }
  let(:d3) { Date.parse('2015-03-03') }

  describe '#filter_dates' do
    subject { described_class.new(value: '[1,3]').filter_dates([d1, d2, d3]) }

    it 'remove day two date' do
      is_expected.to eq([d1, d3])
    end
  end
end

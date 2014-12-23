require 'rails_helper'

describe Goal do
  let(:goal) { Goal.new }

  describe '#weekdays' do
    it { expect(goal.weekdays).to eq([1, 2, 3, 4, 5]) }
  end
end

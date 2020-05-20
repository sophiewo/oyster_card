require 'oystercard'

describe Oystercard do

  subject = Oystercard.new

  it 'should initialize with a balance of 0' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do 
    it 'should add £10 to oystercard balance' do
      expect { subject.top_up }.to change { subject.balance }.by(10)
    end
  end

end
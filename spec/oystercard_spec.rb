require 'oystercard'

describe Oystercard do

  it 'should initialize with a balance of 0' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do 
    it 'should add £10 to oystercard balance' do
      amount = 10
      expect { subject.top_up(amount) }.to change { subject.balance }.by amount
    end

    it 'should raise error if balance exceeds maximum limit' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up(1)}.to raise_error "Top up amount exceeds maximum of #{maximum_balance}"
    end
  end

end
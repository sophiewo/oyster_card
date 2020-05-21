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

  describe '#deduct' do
    it 'should deduct fare from card balance' do
      expect(subject).to respond_to(:deduct)
    end

    it 'should deduct fair amount from card balance' do
      fare = 3
      expect {subject.deduct}.to change { subject.balance}.by -fare
    end
  end

    it 'tracks status of journey' do
      subject.top_up(10)
      expect { subject.touch_in }.to change { subject.in_journey }.from(false).to(true)
    end

  describe "touch_in" do
    it 'changes journey_status to true' do
      subject.top_up(10)
      expect(subject.touch_in).to eq true
    end

    it 'raises error if card balance is less than £1' do
      expect { subject.touch_in}.to raise_error "Not enough money"
    end

  end

   describe "touch_out" do
    it 'changes journey_status to false' do
      expect(subject.touch_out).to eq false
    end
  end

end
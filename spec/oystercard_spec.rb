require 'oystercard'

describe Oystercard do

  subject = Oystercard.new

  it 'should initialize with a balance of 0' do
    # balance = 0
    # oystercard = Oystercard.new
    expect(Oystercard.new.balance).to eq(0)
  end
end
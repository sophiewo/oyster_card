require 'journey'

describe Journey do
  let (:station) { double :oval }
  let (:victoria) { double :victoria }

  it 'should respond to new' do
    expect(Journey).to respond_to(:new)
  end

  it 'should initialize with an empty list of journeys' do
    expect(subject.journeys).to eq []
  end
  it 'reset entry station on touching out' do
    subject.touch_in(station)
    subject.touch_out(victoria)
    expect(subject.entry_station).to eq nil
  end

  describe '#fare' do
    it 'should return penalty fare if entry station is nil on touch out' do
      expect(subject.touch_out(station)).to eq Journey::PENALTY_FARE
    end


  end
 end
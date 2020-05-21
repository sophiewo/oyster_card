class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :entry_station, :journeys

  def initialize
    @balance = 0
    @fare = 3
    @entry_station = nil
    @journeys = []
  end

  def top_up(amount)
    fail "Top up amount exceeds maximum of #{MAXIMUM_BALANCE}" if max_check(amount)
    @balance += amount
  end

   def touch_in(entry_station)
    fail "Not enough money" if low_check
     @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct
    @journeys << {entry: @entry_station, exit: exit_station}
    @entry_station = nil
  end

  def in_journey?
    if @entry_station == nil
      return false
    else true
    end
  end

  private

  def low_check
    @balance < MINIMUM_BALANCE
  end

  def max_check(amount)
    @balance + amount >  MAXIMUM_BALANCE
  end

  def deduct
    @balance -= @fare
  end
end

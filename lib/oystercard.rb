require_relative 'journey'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @fare = 3
    @journeys = Journey.new
  end

  def top_up(amount)
    fail "Top up amount exceeds maximum of #{MAXIMUM_BALANCE}" if max_check(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    fail "Not enough money" if low_check

    @journeys.touch_in(entry_station)
  end

  def touch_out(exit_station)
    @journeys.touch_out(exit_station)
    deduct
  end

  def in_journey?
    @journeys.in_journey?
  end

  def trip_history
    @journeys.trip_history
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

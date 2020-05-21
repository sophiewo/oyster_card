class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @fare = 3
    @in_journey = false
  end

  def top_up(amount)
    fail "Top up amount exceeds maximum of #{MAXIMUM_BALANCE}" if max_check(amount)
    @balance += amount
  end

   def touch_in
    fail "Not enough money" if low_check
    @in_journey = true
  end

  def touch_out
    deduct
    @in_journey = false
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

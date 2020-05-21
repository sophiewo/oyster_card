class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
    @fare = 3
    @journey_status = false
  end

  def top_up(amount)
    fail "Top up amount exceeds maximum of #{MAXIMUM_BALANCE}" if balance + amount >  MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct
    @balance =- @fare
  end

   def touch_in
    @journey_status = true
  end

  def touch_out
    @journey_status = false
  end

  def in_journey?
   return @journey_status
  end

 

  
  
end
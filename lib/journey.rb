
class Journey

  PENALTY_FARE = 6

attr_reader :journeys, :entry_station

  def initialize
    @journeys = []
    @entry_station = nil
  end

  def touch_in(entry_station)
     @entry_station = entry_station
  end

  def touch_out(exit_station)
    @journeys << {entry: @entry_station, exit: exit_station}
    @entry_station = nil 
    fare
    
  end

  def in_journey?
    if @entry_station == nil
      return false
    else true
    end
  end

  def trip_history
    @journeys
  end

  private

  def fare
    if @journeys[-1][:entry] == nil 
      PENALTY_FARE
    end
  end
end

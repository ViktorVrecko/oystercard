class Oystercard
CARD_LIMIT = 90
MINIMUM_BALANCE = 1
MIN_FARE = 1

  attr_reader :balance
  attr_reader :entry_station
  #attr_reader :in_journey

  #def balance
  #  @balance
  #end

  def initialize()
    @balance = 0
    #@status = false
    @entry_station = nil
  end  

  def top_up!(value)
    top_up_check(value)
    @balance += value
  end
  
  #def deduct!(value)
  #  @balance -= value
  #end 
  

  def in_journey?
    #@status
    !!@entry_station
  end

  def touch_in(station)
    touch_in_check
    #@status = true
    @entry_station = station
  end

  def touch_out
    deduct!(MIN_FARE)
    @status = false
    @entry_station = nil
  end



  private 
  
  def deduct!(value)
    @balance -= value
  end 

  def top_up_check(value)
    fail "Limit of #{CARD_LIMIT} reached" if @balance + value > CARD_LIMIT
  end

  def touch_in_check
    fail "Insufficient balance" if  (@balance < MINIMUM_BALANCE)
  end 

end

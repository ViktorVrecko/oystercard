class Oystercard
CARD_LIMIT = 90
MINIMUM_BALANCE = 1

  attr_reader :balance 
  #attr_reader :in_journey

  #def balance
  #  @balance
  #end

  def initialize()
    @balance = 0
    @status = false
  end  

  def top_up!(value)
    top_up_check(value)
    @balance += value
  end
  
  def deduct!(value)
    @balance -= value
  end 
  

  def in_journey?
    @status
  end

  def touch_in
    touch_in_check
    @status = true
  end

  def touch_out
    @status = false
  end



  private 

  def top_up_check(value)
    fail "Limit of #{CARD_LIMIT} reached" if @balance + value > CARD_LIMIT
  end

  def touch_in_check
    fail "insufficient balance: #{MINIMUM_BALANCE}" if  @balance < MINIMUM_BALANCE
  end 
end
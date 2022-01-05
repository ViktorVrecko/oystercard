class Oystercard
CARD_LIMIT = 90

  attr_reader :balance 
 
  def initialize()
    @balance = 0
  end  

  def top_up!(value)
    
    top_up_check(value)
    @balance += value
    
  end
  
  private 

  def top_up_check(value)
    fail "Limit of #{CARD_LIMIT} reached" if @balance + value > CARD_LIMIT
  end

end
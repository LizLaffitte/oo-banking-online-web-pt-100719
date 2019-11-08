class BankAccount
  attr_reader :name, :balance, :status
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(amount)
    @balance += amount
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def balance=(amount)
    @balance = amount
  end
  
  def status=(status_str)
    @status = status_str
  end
  
  def valid?
    if self.balance > 0 && self.status == "open"
      true 
    else
      false 
    end
  end
  
  def close_account
      @status = "closed"
  end
  
end

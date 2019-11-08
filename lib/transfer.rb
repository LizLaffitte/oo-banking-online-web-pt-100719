require_relative './bank_account.rb'
class Transfer
  attr_reader :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if self.sender.valid? && self.receiver.valid?
      true 
    else 
      false 
    end
  end
  
  def status=(status_str)
    @status = status_str
  end
  
  def execute_transaction
    if self.valid? && self.status == "pending" && self.sender.balance > self.amount
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      self.status = "complete"
      puts self.status
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 
  
  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      self.status = "reversed"
    end
  end
  
end


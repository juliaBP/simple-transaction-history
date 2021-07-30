class Account
  attr_reader :balance, :transaction_history
  
  def initialize
    @balance = 10000
    @transaction_history = []
  end
  
  def debit!(amount:)
    valid_amount?(amount: amount) && valid_debit?(amount: amount)
    @balance -= amount
    log_transaction(type: 'debit', amount: amount)
  end
  
  def credit!(amount:)
    if valid_amount?(amount: amount)
      @balance += amount
      log_transaction(type: 'credit', amount: amount)
    end
  end
  
  def print_transaction_history
    p @transaction_history
  end
  
  private
  
  def log_transaction(type:, amount:)
    @transaction_history << {
      type: type,
      amount: amount
    }
  end
  
  def valid_amount?(amount:)
    if !amount.round(2).positive?
      raise StandardError.new('Amount must be a positive number')
    else
      true
    end
  end
  
  def valid_debit?(amount:)
    if amount.round(2) > @balance
      raise StandardError.new('Cannot debit amount greater than account balance')
    else
      true
    end
  end
end

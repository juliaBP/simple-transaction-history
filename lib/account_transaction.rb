class AccountTransaction
  attr_reader :debit_account, :credit_account, :transfer_amount
  
  def initialize(debit_account:, credit_account:, transfer_amount:)
    @debit_account = debit_account
    @credit_account = credit_account
    @transfer_amount = transfer_amount
  end
  
  def execute!
    if valid_accounts?
      @debit_account.debit!(amount: @transfer_amount)
      @credit_account.credit!(amount: @transfer_amount)
    end
  end
  
  private
  
  def valid_accounts?
    unless [@debit_account, @credit_account].all? { |a| a.is_a?(Account) }
      raise StandardError.new('Can only do a transaction between two accounts')
    else
      true
    end
  end
end

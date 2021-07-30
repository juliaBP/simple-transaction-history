require_relative '../../lib/account'

describe Account do
  describe 'initialization' do
    it 'starts with a balance of 10,000' do
      expect(Account.new.balance).to equal(10000)
    end
    
    it 'starts with an empty transaction history array' do
      expect(Account.new.transaction_history).to be_a(Array)
      expect(Account.new.transaction_history).to be_empty
    end
  end
    
  describe '#debit!' do
    it 'decreases balance by given amount' do
      account = Account.new
      expect{ account.debit!(amount: 100) }.to change(account, :balance).from(10000).to(9900)
    end
    
    it 'logs a correct entry in the account transaction history' do
      account = Account.new
      expect{ account.debit!(amount: 100) }.to change(account.transaction_history, :length).from(0).to(1)
      expect(account.transaction_history).to match_array([{ type: 'debit', amount: 100} ])
    end
    
    it 'cannot decrease balance to less than 0' do
      account = Account.new
      expect{ account.debit!(amount: 10001) }.to raise_error(StandardError)
    end
    
  end
  
  describe '#credit!' do
    it 'increases balance by given amount' do
      account = Account.new
      expect{ account.credit!(amount: 100) }.to change(account, :balance).from(10000).to(10100)
    end
    
    it 'logs a correct entry in the account transaction history' do
      account = Account.new
      expect{ account.credit!(amount: 100) }.to change(account.transaction_history, :length).from(0).to(1)
      expect(account.transaction_history).to match_array([{ type: 'credit', amount: 100} ])
    end
  end
end

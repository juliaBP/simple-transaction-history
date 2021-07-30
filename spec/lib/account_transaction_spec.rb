require_relative '../../lib/account_transaction'
require_relative '../../lib/account'

describe AccountTransaction do
  describe '#execute!' do
    context 'success' do
      it 'debits the debit_account by the transfer_amount' do
        account_1 = Account.new
        account_2 = Account.new
        account_transaction = AccountTransaction.new(debit_account: account_1, credit_account: account_2, transfer_amount: 100)
        expect{ account_transaction.execute! }.to change(account_1, :balance).from(10000).to(9900)
      end
      it 'credits the credit_account by the transfer_amount' do
        account_1 = Account.new
        account_2 = Account.new
        account_transaction = AccountTransaction.new(debit_account: account_1, credit_account: account_2, transfer_amount: 100)
        expect{ account_transaction.execute! }.to change(account_2, :balance).from(10000).to(10100)
      end
    end
    
    context 'failure' do
      it 'raises an error when amount is not valid' do
        account_1 = Account.new
        account_2 = Account.new
        account_transaction = AccountTransaction.new(debit_account: account_1, credit_account: account_2, transfer_amount: 1000000)
        expect{ account_transaction.execute! }.to raise_error(StandardError)
      end
      
      it 'does not change debit account value' do
        account_1 = Account.new
        account_2 = Account.new
        account_transaction = AccountTransaction.new(debit_account: account_1, credit_account: account_2, transfer_amount: 1000000)
        expect {
          begin account_transaction.execute!;
          rescue StandardError; end
        }.not_to change(account_1, :balance)
      end
      
      it 'does not change credit account value' do
        account_1 = Account.new
        account_2 = Account.new
        account_transaction = AccountTransaction.new(debit_account: account_1, credit_account: account_2, transfer_amount: 1000000)
        expect {
          begin account_transaction.execute!;
          rescue StandardError; end
        }.not_to change(account_2, :balance)
      end
    end
  end
end

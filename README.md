# Simple Transaction History
Write a simple transaction history for multiple accounts

## Core Functions
* Create an account
  * Accounts start with a balance of $10,000.00
  * An account's balance cannot drop below 0.

* Transfer between accounts
  * Funds can be transferred from one account in the application to another account in the same application. A credit in one account always has a corresponding debit in another account.

* Print account transfer history
  * A full history of all transactions for an account can be retrieved at any time.

## Set up
0. Install the Ruby version indicated in [.ruby-version](.ruby-version) by your method of choice. Be sure to use it for the remainder of setup and when running and testing the application.
0. If you do not have bundler (`which bundler`), install bundler (`gem install bundler`).
0. `bundle install`.

## Use
```shell
irb
require_relative 'lib/account'
require_relative 'lib/account_transaction'
```

## Testing
```shell
bundle exec rspec spec[/lib[/account.rb | /account_transaction.rb]]
```

## Rationale for technology choices and design decisions
* Ruby for familiarity, ease of development, OO adaptability, and community/availability of libraries
* OO design to better model real-world relationships

## Rationale for inclusion of dependencies
* RSpec to ensure and document application functionality
* PG to manage PostgreSQL connection in application language

## Assumptions
* User intends to put in a valid amount of currency if the amount is numeric, e.g. amounts will be rounded to nearest cent.
* Transactions should be printed in the order that they were made.

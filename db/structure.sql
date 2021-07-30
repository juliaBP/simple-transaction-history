create sequence if not exists accounts_id_seq
  start with 1
  increment by 1
  no minvalue
  no maxvalue
;

create sequence if not exists account_transactions_id_seq
  start with 1
  increment by 1
  no minvalue
  no maxvalue
;

create table if not exists accounts (  
  id bigint not null default nextval('accounts_id_seq') primary key,
  balance decimal(7, 2) not null check(balance >= 0) default 10000.00
)
;

create table if not exists account_transactions (  
  id bigint not null default nextval('account_transactions_id_seq') primary key,
  credit_account_id integer not null check(credit_account_id != debit_account_id) references accounts (id),
  debit_account_id integer not null check(debit_account_id != credit_account_id) references accounts (id),
  amount decimal(7, 2) not null check(amount > 0),
  created_at timestamp not null default now()
)
;

-- begin;
-- update accounts set balance = balance - 10000 where id = 1;
-- update accounts set balance = balance + 10000 where id = 2;
-- insert into account_transactions (credit_account_id, debit_account_id, amount)
--   values (1, 2, 10000);
-- commit;

-- select
--   case credit_account_id
--     when 1 then 'credit'
--     else 'debit'
--   end as type,
--   amount
--   from account_transactions
-- where credit_account_id = 1
--   or debit_account_id = 1
-- order by created_at
-- ;

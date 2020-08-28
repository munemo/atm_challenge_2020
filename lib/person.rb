require './lib/account'
require './lib/atm'
require 'pry'

class Person
  attr_accessor :name, :account, :cash

  def initialize(attrs = {})
    @name = set_owner(attrs[:name])

    @cash = 0

    @account = nil
  end

  def set_owner(name)
    name.nil? ? missing_owner : name
  end

  def missing_owner
    raise 'A name is required'
   end

  def create_account
    @account = Account.new(owner: self)
  end

  def deposit(amount)
    @account.nil? ? missing_account : deposit_cash(amount)
  end

  def deposit_cash(amount)
    @account.balance += amount
    @cash -= amount
  end

  def missing_account
    raise 'No account present'
  end

  def withdraw(x)
    @account.nil? ? missing_account : withdraw_money(x)
  end

  def withdraw_money(x)
    x[:atm].nil? ? missing_ATM : true
    @account.balance -= x[:amount]
    @cash += x[:amount]
    #algo = :atm(@funds)
    #binding.pry

    #[2] pry(#<Person>)> x[:atm]
    #=> #<Atm:0x00007fda819b67a8 @funds=1000>
=begin

  x = {:amount=>100, x contiene todo esto
    :pin=>9282,
    :account=>#<Account:0x00007fa5e3218aa0
      @account_status=:active,
      @balance=0,
      @exp_date="08/25",
      @owner=#<Person:0x00007fa5e3218af0
      @account=#<Account:0x00007fa5e3218aa0 ...>,
      @cash=0,
      @name="Thomas">,
      @pin_code=9282>}

      {:amount=>100, el ultimo test agrega 100 a balance
        :pin=>1703,
        :account=>#<Account:0x00007ff2050d2600
          @account_status=:active,
          @balance=100,
          @exp_date="08/25",
          @owner=#<Person:0x00007ff2050d2650
            @account=#<Account:0x00007ff2050d2600 ...>,
            @cash=0,
            @name="Thomas">,
          @pin_code=1703>,
        :atm=>#<Atm:0x00007ff2050d23d0 @funds=1000>}
=end
    #El saldo de la cuenta debe DISMINUIR balance

    #Los fondos en el cajero automático deben DISMINUIR funds

    #El efectivo en el bolsillo debe AUMENTAR cash

  end

  def missing_ATM
    raise 'An ATM is required'
end
end

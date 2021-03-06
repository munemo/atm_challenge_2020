class Atm
  attr_accessor :funds, :balance
  require 'date'

  def initialize
    @funds = 1000
  end

  def withdraw(amount, pin_code, account, account_status)
    if insufficient_funds_in_account?(amount, account)
      { status: false, message: 'insufficient funds', date: Date.today }
    elsif insufficient_funds_in_atm?(amount)
      { status: false, message: 'insufficient funds in ATM', date: Date.today }
    elsif incorrect_pin?(pin_code, account.pin_code)
      { status: false, message: 'wrong pin', date: Date.today }
    elsif card_expired?(account.exp_date)
      { status: false, message: 'card expired', date: Date.today }
    elsif disabled(account_status)
      { status: false, message: 'account disabled', date: Date.today }

    else
      active(account_status)
      perform_transaction(amount, account)
    end
  end

  private

  def active(account_status)
    true
  end

  def disabled(account_status)
    false
   end

  def insufficient_funds_in_atm?(amount)
    @funds < amount
  end

  def insufficient_funds_in_account?(amount, account)
    amount > account.balance
  end

  def perform_transaction(amount, account)
    @funds -= amount

    account.balance = account.balance - amount
    { status: true, message: 'success', date: Date.today, amount: amount, bills: add_bills(amount) }
  end

  def add_bills(amount)
    denominations = [20, 10, 5]
    bills = []
    denominations.each do |bill|
      while amount - bill >= 0
        amount -= bill
        bills << bill
      end
    end
    bills
  end

  def incorrect_pin?(pin_code, actual_pin)
    pin_code != actual_pin
  end

  def card_expired?(exp_date)
    Date.strptime(exp_date, '%m/%y') < Date.today
  end
end

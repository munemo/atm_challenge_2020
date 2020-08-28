require './lib/account'
require './lib/atm'
require 'pry'


class Person

    attr_accessor :name, :account, :cash


 def initialize (attrs = {})

        @name = set_owner(attrs[:name])

        @cash = 0

        @account = nil

 end

 def set_owner(name)
        
        name == nil ?  missing_owner : name
 end
      
def missing_owner
        raise "A name is required"
 end

 def create_account

    @account = Account.new(owner:self)
 
 end

 def  deposit(amount)

   @account == nil ?  missing_account : deposit_cash(cash)
 end

 def deposit_cash (cash)
   account.balance += cash
 end

 
 def  missing_account

     raise RuntimeError, 'No account present'
 end

end
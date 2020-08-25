class ATM


    attr_accessor:fund
    attr_accessor:amount
    

    def initialize

       @fund = 1000
    end 
    
    def withdraw (amount, account)
        
        case

         when amount > account.balance
         return          
        else
         @fund -= amount
         account.balance = account.balance - amount
         require 'date'
         { status: true, message: 'success', date: Date.today, amount: amount}
           
        end
      end
   
end
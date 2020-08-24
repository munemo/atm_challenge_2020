class ATM


    attr_accessor:fund
    attr_accessor:amount
    

    def initialize

       @fund = 50000
    end 
    
    def withdraw (amount)
        @fund -= amount
    end
end
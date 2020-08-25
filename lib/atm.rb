class ATM


    attr_accessor:fund
    attr_accessor:amount
    

    def initialize

       @fund = 1000
    end 
    
    def withdraw (amount)
        @fund -= amount
        { status: true, message: 'success', date: '2016-01-30', amount: 35, bills: [20,10,5]}
        { status: false, message: '[reason for failure e. e. wrong pin]', date: '2016-01-30'}

   end
end
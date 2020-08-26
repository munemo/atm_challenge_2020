class Person_account

    require 'securerandom'

    attr_accessor :name

    STANDARD_VALIDITY_YRS = 5

    def initialize 

    end


    def newAccount
        my_account = new.Person_account
        password = SecureRandom.random_number(10000)
    end


    def account_name(name)
        if name != nil
            return 'has a name'
        else
            return 'no name'
        end
    end

    def set_expire_date
       Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
    end

end
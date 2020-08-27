class Person_account

    attr_accessor :name, :account_status, :pin_code, :owner, :exp_date

    STANDARD_VALIDITY_YRS = 5

    def initialize(attrs = {})
        @account_status = :active
        @pin_code = rand(1000..9999)
        set_owner(attrs[:owner])
        @exp_date = set_expire_date

    end

    
    private

    def set_owner(obj)
        
        obj == nil ?  missing_owner : @owner = obj
    end
      
      def missing_owner
        raise "An Account owner is required"
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

    def self.deactivate(account)
        account.account_status = :deactivated
      end
end
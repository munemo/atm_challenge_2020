require './lib/account'
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


end



require './lib/account.rb'

describe Person_account do

#let(:account) { instance_double('Account', pin_code: '1234', exp_date: '04/21', account_status: :active) }

    it 'check if user has a name' do
        expected_output = 'has a name'
        expect(subject.account_name('John John')).to eq expected_output
    end
end


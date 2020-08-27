require './lib/account.rb'

describe Person_account do

#let(:account) { instance_double('Account', pin_code: '1234', exp_date: '04/21', account_status: :active) }

    it 'check if the user has a name' do
        expected_output = 'has a name'
        expect(subject.account_name('John John')).to eq expected_output
    end

    it 'check the length of the pin code' do
        number = 1234
        number_length = Math.log10(number).to_i + 1
        expect(number_length).to eq 4
    end
    it 'is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_year(5).strftime("%m/%y")
    expect(subject.set_expire_date).to eq expected_date
    end

    it 'is expected to have :active status on initialize' do
        expect(subject.account_status).to eq :active
    end

    it 'deactivates account using the instance method' do
        subject.deactivate
        expect(subject.account_status).to eq :deactivated
    end
end


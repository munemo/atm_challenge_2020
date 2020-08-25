require './lib/atm.rb'

describe ATM do

    let(:account) { instance_double('Account') }

    before do

      allow(account).to receive(:balance).and_return(100)

      allow(account).to receive(:balance=)
    end

    it 'has $50 000 on initialize' do
        expect(subject.fund).to eq 1000
    end


    it 'funds are reduced at withdraw' do
        subject.withdraw(50, account) 
        expect(subject.fund).to eq 950 
    end

    it 'allow withdraw if the account has enough balance.' do

      require 'date'
        expected_output = { status: true, message: 'success', date: Date.today, amount: 45 }
        expect(subject.withdraw(45, account)).to eq expected_output
    end
end

require './lib/atm.rb'

describe ATM do

    it 'has $50 000 on initialize' do
        expect(subject.fund).to eq 50000
    end


    it 'funds are reduced at withdraw' do
        subject.withdraw 45000 
        expect(subject.fund).to eq 5000 
    end


end

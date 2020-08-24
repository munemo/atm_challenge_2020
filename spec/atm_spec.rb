require './lib/atm.rb'

describe ATM do

    it 'has $50 000 on initialize' do
        expect(subject.fund).to eq 50000
    end

end

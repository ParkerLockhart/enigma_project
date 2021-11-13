require './lib/enigma'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@enigma).to be_instance_of(Enigma)
    end
  end

  describe '#encrypt' do
    it 'encrypts a message' do
      expect(@enigma.encrypt("Hello World!", "02715", "08041995")).to be_instance_of(Hash)
      expect(@enigma.encrypt("Hello World!", "02715", "08041995").keys).to eq([:encryption, :key, :date])
      expect(@enigma.encrypt("Hello World!", "02715", "08041995")).to eq({:date=>"08041995", :encryption=>"jgnnqbyqtnf!", :key=>"02715"})
    end
  end
end

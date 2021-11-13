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
      expect(@enigma.encypt).to be_instance_of(Hash)
      expect(@enigma.encrypt.keys).to eq([:encryption, :key, :date])
    end
  end
end

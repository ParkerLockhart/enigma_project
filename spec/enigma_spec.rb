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
      expect(@enigma.encrypt("Hello World!", "02715", "08041995")[:encryption]).not_to eq("Hello World!")
    end
  end

  describe '#decrypt' do
    it 'decrypts a cipher' do
      decrypted = "hello world!"
      expect(@enigma.decrypt("jedeq ohtlw!", "02715", "08041995")).to be_instance_of(Hash)
      expect(@enigma.decrypt("jedeq ohtlw!", "02715", "08041995").keys).to eq([:decryption, :key, :date])
      expect(@enigma.decrypt("jedeq ohtlw!", "02715", "08041995")[:decryption]).to eq(decrypted)
    end
  end
end

require './lib/scrambler'
require 'date'

describe Scrambler do
  before(:each) do
    @scrambler = Scrambler.new("02715", "08041995")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@scrambler).to be_instance_of(Scrambler)
    end

    it 'has a key' do
      expect(@scrambler.key).to be_instance_of(String)
      expect(@scrambler.key.length).to eq(5)
      expect(@scrambler.key).to eq("02715")
    end

    it 'has a date' do
      expect(@scrambler.date).to be_instance_of(String)
      expect(@scrambler.date.length).to eq(8)
      expect(@scrambler.date).to eq("08041995")
    end

    it 'has an offset' do
      expect(@scrambler.offset).to be_instance_of(Hash)
      expect(@scrambler.offset.keys).to eq(["A", "B", "C", "D"])
    end
  end

  describe '#shift' do
    it 'generates shift from offset and key' do
      expect(@scrambler.shift).to be_instance_of(Hash)
      expect(@scrambler.shift.keys).to eq(["A", "B", "C", "D"])
      expect(@scrambler.shift).not_to eq(@scrambler.offset)
    end
  end

  describe '#scramble' do
    it 'encrypts' do
      message = "Hello World!"
      expect(@scrambler.scramble(message)).to be_instance_of(String)
      expect(@scrambler.scramble(message).length).to eq(message.length)
      expect(@scrambler.scramble(message)).not_to eq(message)
    end
  end

  describe '#unscramble' do
    it 'decrypts' do
      message = "hello world!"
      cipher = "jedeq ohtlw!"
      expect(@scrambler.unscramble(cipher)).to be_instance_of(String)
      expect(@scrambler.unscramble(cipher).length).to eq(cipher.length)
      expect(@scrambler.unscramble(cipher)).to eq(message)
    end
  end
end

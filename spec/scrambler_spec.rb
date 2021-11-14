require './lib/scrambler'
require 'date'

describe Scrambler do
  before(:each) do
    @scrambler = Scrambler.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@scrambler).to be_instance_of(Scrambler)
    end

    it 'has a offset' do
      expect(@scrambler.offset).to be_instance_of(Hash)
      expect(@scramber.offset.keys).to eq(["A", "B", "C", "D"])
    end

    it 'has a key' do
      expect(@scrambler.key).to be_instance_of(String)
      expect(@scrambler.key.length).to eq(5)
    end

    it 'has a date' do
      expect(@scrambler.date).to be_instance_of(String)
      expect(@scrambler.date.length).to eq(6)
    end

    it 'has a shift' do
      expect(@scrambler.shift).to be_instance_of(Hash)
      expect(@scrambler.shift.keys).to eq(["A", "B", "C", "D"])
    end

    it 'has a set' do
      expect(@scrambler.set).to be_instance_of(Array)
      expect(@scrambler.set.length).to eq(27)
    end 
  end

  describe '#key_generator' do
    it 'generates random key' do
      expect(0..99999).to cover(a_class.key_generator.to_i)
      expect(a_class.key_generator.to_s.length).to eq(5)
    end
  end

  describe '#offset_generator' do
    it 'generates offset from date' do
      expect(a_class.offset_generator(Date.today)).to be_instance_of(Hash)
      expect(a_class.offset_generator(Date.today).keys).to eq(["A", "B", "C", "D"])
    end
  end

  describe '#shift_generator' do
    it 'generates shift from key and offset' do
      key = "02715"
      offset = {"A" => 1, "B" => 0, "C" => 2, "D" => 5}
      expect(a_class.shift_generator(key, offset)).to be_instance_of(Hash)
      expect(a_class.shift_generator(key, offset)).to eq({"A" => 3, "B" => 27, "C" => 73, "D" => 20})
    end
  end

  describe '#scramble' do
    it 'encrypts' do
      message = "Hello World!"
      expect(a_class.scramble(message, "02715", "08041995")).to be_instance_of(String)
      expect(a_class.scramble(message, "02715", "08041995").length).to eq(message.length)
      expect(a_class.scramble(message, "02715", "08041995")).not_to eq(message)
    end
  end

  describe '#unscramble' do
    it 'decrypts' do
      message = "hello world!"
      cipher = "jgnnqbyqtnf!"
      expect(a_class.unscramble(cipher, "02715", "08041995")).to be_instance_of(String)
      expect(a_class.unscramble(cipher, "02715", "08041995").length).to eq(cipher.length)
      expect(a_class.unscramble(cipher, "02715", "08041995")).to eq(message)
    end
  end
end

require './lib/scrambler'
require 'date'

describe Scrambler do
  let(:a_class) do
    Class.new do
      extend Scrambler
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
end

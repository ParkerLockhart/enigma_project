require './lib/tools'
require 'date'

describe Tools do
  let(:a_class) do
    Class.new do
      extend Tools
    end
  end

  describe '#key_generator' do
    it 'generates random key' do
      expect(0..99999).to cover(a_class.key_generator.to_i)
      expect(a_class.key_generator.to_s.length).to eq(5)
    end
  end

  describe '#date_fixer' do
    it 'takes in date and outputs in integer format' do
      expect(a_class.date_fixer(Date.today)).to be_instance_of(Integer)
      expect(a_class.date_fixer("08041995")).to be_instance_of(Integer)
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

  describe '#shift_a' do
    it 'creates an array of numbers to use for shift A' do
      expect(a_class.shift_a).to be_instance_of(Array)
    end
  end

  describe '#shift_b' do
    it 'creates an array of numbers to use for shift B' do
      expect(a_class.shift_b).to be_instance_of(Array)
    end
  end

  describe '#shift_c' do
    it 'creates an array of numbers to use for shift C' do
      expect(a_class.shift_c).to be_instance_of(Array)
    end
  end

  describe '#shift_d' do
    it 'creates an array of numbers to use for shift D' do
      expect(a_class.shift_d).to be_instance_of(Array)
    end
  end
end

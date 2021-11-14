require './lib/tools'

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

  describe '#offset_generator' do
    it 'generates offset from date' do
      expect(a_class.offset_generator(Date.today)).to be_instance_of(Hash)
      expect(a_class.offset_generator(Date.today).keys).to eq(["A", "B", "C", "D"])
    end
  end
end

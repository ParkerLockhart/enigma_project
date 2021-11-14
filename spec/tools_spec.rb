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
end

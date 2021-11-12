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
end

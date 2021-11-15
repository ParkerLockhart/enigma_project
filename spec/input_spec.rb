require './lib/input'

describe 'Input' do
  before(:each) do
    @input = Input.new
    allow(@input).to receive(:file_in).and_return("message.txt")
    allow(@input).to receive(:file_out).and_return("encrypted.txt")
    allow(@input).to receive(:key).and_return("04269")
    allow(@input).to receive(:date).and_return("111521")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@input).to be_instance_of(Input)
    end

    it 'has a file_in' do
      expect(@input.file_in).to eq("message.txt")
    end

    it 'has a file_out' do
      expect(@input.file_out).to eq("encrypted.txt")
    end

    it 'has a key' do
      expect(@input.key).to eq("04269")
    end

    it 'has a date' do
      expect(@input.date).to eq("111521")
    end
  end
end

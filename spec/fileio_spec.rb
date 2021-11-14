require './lib/fileio'

describe Fileio do
  before(:each) do
    @handler = Fileio.new
    allow(@handler).to receive(:file_in).and_return("message.txt")
    allow(@handler).to receive(:file_out).and_return("encrypted.txt")
    allow(@handler).to receive(:key).and_return("82648")
    allow(@handler).to receive(:date).and_return("240818")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@handler).to be_instance_of(Fileio)
    end

    it 'has a file_in' do
      expect(@handler.file_in).to eq("message.txt")
    end

    it 'has a file_out' do
      expect(@handler.file_out).to eq("encrypted.txt")
    end

    it 'has a key' do
      expect(@handler.key).to eq("82648")
    end

    it 'has a date' do
      expect(@handler.date).to eq("240818")
    end
  end
end

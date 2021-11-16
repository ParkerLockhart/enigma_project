require './lib/fileio'
require './lib/input'
require 'date'
require 'tools'

describe Fileio do
  before(:each) do
    @handler = Fileio.new
    @input = instance_double("Input")
    @handler.input = @input

    allow(@input).to receive(:key).and_return("04269")
    allow(@input).to receive(:date).and_return("111521")

    allow(@handler).to receive(:file_input).and_return(["hello world!"])
    allow(@handler).to receive(:message).and_return(@handler.file_input)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@handler).to be_instance_of(Fileio)
    end

    it 'has input' do
      allow(@input).to receive(:file_in).and_return("message.txt")
      allow(@input).to receive(:file_out).and_return("encrypted.txt")
      expect(@input.file_in).to eq("message.txt")
      expect(@input.file_out).to eq("encrypted.txt")
      expect(@input.key).to eq("04269")
      expect(@input.date).to eq("111521")
    end

    it 'has a message' do
      expect(@handler.message).to be_instance_of(Array)
      expect(@handler.message).to eq(["hello world!"])
    end

    it 'has a generated_key' do
      expect(@handler.generated_key).to eq(nil)
      @handler.message_encrypt
      expect(@handler.generated_key).to be_instance_of(String)
      expect(@handler.generated_key.length).to eq(5)
    end

    it 'has an encrypted_date' do
      expect(@handler.encrypted_date).to eq(nil)
      @handler.message_encrypt
      expect(@handler.encrypted_date).to eq(@handler.date_fixer(Date.today).to_s)
    end
  end

  describe '#encryption_process' do
    it 'calls all methods for encryption process' do
      file = double("file")
      allow(file).to receive(:open).with("message.txt", "w+").and_yield("Hello World!")
      allow(@input).to receive(:file_out).and_return("encrypted.txt")
      expect(@handler.encryption_process).to eq(@handler.encrypted)
    end
  end

  describe '#decryption_process' do
    it 'calls all methods for decryption process' do
      file = double("file")
      allow(file).to receive(:open).with("encrypted.txt", "w+").and_yield("oxoavszdydg!")
      allow(@input).to receive(:file_out).and_return("decrypted.txt")
      expect(@handler.decryption_process).to eq(@handler.decrypted)
    end
  end

  describe '#file_input' do
    it 'reads file into array and saves to message attribute' do
      expect(@handler.file_input).to be_instance_of(Array)
      expect(@handler.file_input).to eq(@handler.message)
    end
  end

  describe '#message_encrypt' do
    it 'encrypts a message' do
      expect(@handler.message_encrypt[0]).to be_instance_of(Hash)
      expect(@handler.message_encrypt[0][:date]).to eq(@handler.encrypted_date)
      expect(@handler.message_encrypt).not_to eq(@handler.message)
    end
  end

  describe '#cipher_decrypt' do
    it 'decrypts a cipher' do
      allow(@handler).to receive(:message).and_return(["oxoavszdydg!"])
      expect(@handler.cipher_decrypt[0]).to be_instance_of(Hash)
      expect(@handler.cipher_decrypt[0][:key]).to eq(@input.key)
      expect(@handler.cipher_decrypt[0][:date]).to eq(@input.date)
      expect(@handler.cipher_decrypt[0][:decryption]).to eq("hello world!")
    end
  end

  describe '#encrypted' do
    it 'prints encryption confirmation to console' do
      file = double("file")
      allow(file).to receive(:open).with("message.txt", "w+").and_yield("Hello World!")
      allow(@input).to receive(:file_out).and_return("encrypted.txt")
      encrypted_message = "Created '#{@input.file_out}' with the key #{@handler.generated_key} and date #{@handler.encrypted_date}"
      expect(@handler.encrypted).to eq(encrypted_message)
    end
  end

  describe '#decrypted' do
    it 'prints decryption confirmation to console' do
      file = double("file")
      allow(file).to receive(:open).with("encrypted.txt", "w+").and_yield("oxoavszdydg!")
      allow(@input).to receive(:file_out).and_return("decrypted.txt")
      decrypted_message = "Created '#{@input.file_out}' with the key #{@input.key} and date #{@input.date}"
      expect(@handler.decrypted).to eq(decrypted_message)
    end
  end
end

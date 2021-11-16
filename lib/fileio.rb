require './lib/enigma'
require './lib/tools'
require './lib/input'

class Fileio < Enigma
  include Tools
  attr_accessor :input, :message, :generated_key, :encrypted_date

  def initialize
    @input = Input.new
    @message = []
    @generated_key = nil
    @encrypted_date = nil
  end

  def encryption_process
    file_input
    message_encrypt
    encrypted
  end

  def decryption_process
    file_input
    cipher_decrypt
    decrypted
  end

  def file_input
    File.foreach(filepath(@input.file_in), chomp: true) do |line|
      @message << line
    end
  end

  def message_encrypt
    info = encrypt(message[0])
    @generated_key = info[:key]
    @encrypted_date = info[:date]
    encrypted_done = []
    message.each do |line|
      encrypted_done << encrypt(line, @generated_key)
    end
    @message = encrypted_done
  end

  def encrypted
    file = File.open(filepath(@input.file_out), "w+")
    @message.each do |line|
      file.write(line[:encryption] + "\n")
    end
    file.close
    p "Created '#{@input.file_out}' with the key #{@generated_key} and date #{@encrypted_date}"
  end

  def cipher_decrypt
    decrypted_done = []
    message.each do |line|
      decrypted_done << decrypt(line, @input.key, @input.date)
    end
    @message = decrypted_done
  end

  def decrypted
    file = File.open(filepath(@input.file_out), "w+")
    @message.each do |line|
      file.write(line[:decryption] + "\n")
    end
    file.close
    p "Created '#{@input.file_out}' with the key #{@input.key} and date #{@input.date}"
  end
end

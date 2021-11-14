require './lib/enigma'

class Fileio < Enigma
  attr_accessor :file_in, :file_out, :key, :date, :message

  def initialize
    @file_in = ARGV[0]
    @file_out = ARGV[1]
    @key = ARGV[2]
    @date = ARGV[3]
    @message = []
    @generated_key = nil
    @encrypted_date = nil
  end

  def message_in
    File.foreach(filepath(@file_in), chomp: true) do |line|
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

  def message_out
    file = File.open(filepath(@file_out), "w+")
    @message.each do |line|
      file.write(line[:encryption] + "\n")
    end
    file.close
  end

  def filepath(filename)
    file = "./lib/" + filename
  end

  def encrypted
    message_in
    message_encrypt
    message_out
    puts "Created '#{@file_out}' with the key #{@generated_key} and date #{@encrypted_date}"
  end

  def message_decrypt
    decrypted_done = []
    message.each do |line|
      decrypted_done << decrypt(line, @key, @date)
    end
    @message = decrypted_done
  end

  def cipher_out
    file = File.open(filepath(@file_out), "w+")
    @message.each do |line|
      file.write(line[:decryption] + "\n")
    end
    file.close
  end
end

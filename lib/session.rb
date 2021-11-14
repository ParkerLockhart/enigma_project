require 'date'
require 'time'

class Session
  attr_reader :date, :time

  def initialize
    @time = Time.now
    @date = Date.today
  end

  def start
    puts " "*3
    puts "~ * ~ * Welcome to Enigma * ~ * ~"
    puts " "*3
    greeting
  end

  def greeting
    if @time.hour.between?(4, 11)
      puts "Good morning!"
    elsif @time.hour.between?(12, 16)
      puts "Good afternoon!"
    elsif @time.hour.between?(17, 23)
      puts "Good evening!"
    elsif @time.hour.between?(0, 3)
      puts "Hello there, night owl!"
    end
    puts "It is currently #{@time.strftime("%A, %B %d %Y at %I:%M %p")}."
    encrypt_or_decrypt
  end
end

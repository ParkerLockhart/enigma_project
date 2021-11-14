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
end

require 'date'
require 'time'

class Session
  attr_reader :date, :time

  def initialize
    @time = Time.now
    @date = Date.today
  end
end 

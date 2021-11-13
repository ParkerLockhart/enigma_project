require './lib/session'
require 'date'
require 'time'

describe Session do
  before(:each) do
    @session = Session.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@session).to be_instance_of(Session)
    end

    it 'has a date' do
      expect(@session.date).to be_instance_of(Date)
    end

    it 'has a time' do
      expect(@session.time).to be_instance_of(Time)
    end
  end
end

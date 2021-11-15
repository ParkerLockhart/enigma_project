require 'date'
require './lib/tools'

class Scrambler
  include Tools

  attr_reader :key, :date, :offset

  def initialize(key, date)
    @key = key
    @date = date
    @offset = offset_generator(date)
  end

  def shift
    shift_generator(@key, @offset)
  end

  def scramble(message)
    message = message.downcase.each_char.to_a
    set = ("a".."z").to_a << " "

    message.each_with_index do |char, index|
      if set.include?(char)
        if shift_a.include?(index)
          x = set.find_index(char)
          set = set.rotate(shift["A"])
          char.replace(set[x])
        elsif shift_b.include?(index)
          x = set.find_index(char)
          set = set.rotate(shift["B"])
          char.replace(set[x])
        elsif shift_c.include?(index)
          x = set.find_index(char)
          set = set.rotate(shift["C"])
          char.replace(set[x])
        elsif shift_d.include?(index)
          x = set.find_index(char)
          set = set.rotate(shift["D"])
          char.replace(set[x])
        end
      end
    end
    message.join
  end

  def unscramble(cipher)
    cipher = cipher.each_char.to_a
    set = ("a".."z").to_a << " "
    
    cipher.each_with_index do |char, index|
      if set.include?(char)
        if shift_a.include?(index)
          x = set.find_index(char)
          set = set.rotate(-shift["A"])
          char.replace(set[x])
        elsif shift_b.include?(index)
          x = set.find_index(char)
          set = set.rotate(-shift["B"])
          char.replace(set[x])
        elsif shift_c.include?(index)
          x = set.find_index(char)
          set = set.rotate(-shift["C"])
          char.replace(set[x])
        elsif shift_d.include?(index)
          x = set.find_index(char)
          set = set.rotate(-shift["D"])
          char.replace(set[x])
        end
      end
    end
    cipher.join
  end
end

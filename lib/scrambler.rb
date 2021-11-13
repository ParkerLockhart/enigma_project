require 'date'

module Scrambler

  def key_generator
    keys = Range.new(0, 99999, exclude_end = false)
    keys = keys.map do |key|
      key.to_s.rjust(5, "0")
    end
    keys.to_a.sample
  end

  def offset_generator(date)
    if date.class == Date
      date = date.strftime("%m%d%Y").to_i
    elsif date.class == String
      date = date.to_i
    end
    sq = (date * date).to_s
    four = sq.slice(-4, 4)
    offset = {"A" => four.slice(0), "B" => four.slice(1), "C" => four.slice(2), "D" => four.slice(3)}
    offset.transform_values! do |v|
      v.to_i
    end
  end

  def shift_generator(key, offset)
    key = {"A" => key.slice(0, 2), "B" => key.slice(1, 2), "C" => key.slice(2, 2), "D" => key.slice(3, 2)}
    key.transform_values! do |v|
      v.to_i
    end
    shift = key.merge(offset) { |k, new, old| new + old }
  end

  def scramble(message, key, date)

    offset = offset_generator(date)
    shift = shift_generator(key, offset)
    set = ("a".."z").to_a << " "
    a = shift_a
    b = shift_b
    c = shift_c
    d = shift_d

    message = message.downcase.each_char.to_a

    message.each_with_index do |char, index|
      if set.include?(char)
        if a.include?(index)
          x = set.find_index(char)
          set = set.rotate(shift["A"])
          char.replace(set[x])
        elsif b.include?(index)
          x = set.find_index(char)
          set = set.rotate(shift["B"])
          char.replace(set[x])
        elsif c.include?(index)
          x = set.find_index(char)
          set = set.rotate(shift["C"])
          char.replace(set[x])
        elsif d.include?(index)
          x = set.find_index(char)
          set = set.rotate(shift["D"])
          char.replace(set[x])
        end
      end
    end
    message.join
  end

  def unscramble(cipher, key, date)
    offset = offset_generator(date)
    shift = shift_generator(key, offset)
    set = ("a".."z").to_a << " "
    a = shift_a
    b = shift_b
    c = shift_c
    d = shift_d

    cipher = cipher.each_char.to_a

    cipher.each_with_index do |char, index|
      if set.include?(char)
        if a.include?(index)
          x = set.find_index(char)
          set = set.rotate(-shift["A"])
          char.replace(set[x])
        elsif b.include?(index)
          x = set.find_index(char)
          set = set.rotate(-shift["B"])
          char.replace(set[x])
        elsif c.include?(index)
          x = set.find_index(char)
          set = set.rotate(-shift["C"])
          char.replace(set[x])
        elsif d.include?(index)
          x = set.find_index(char)
          set = set.rotate(-shift["D"])
          char.replace(set[x])
        end
      end
    end
    cipher.join
  end

  def shift_a
    range = (0..5000)
    index = []
    range.step(4) do |num|
      index << num
    end
  end

  def shift_b
    range = (1..5000)
    index = []
    range.step(4) do |num|
      index << num
    end
  end

  def shift_c
    range = (2..5000)
    index = []
    range.step(4) do |num|
      index << num
    end
  end

  def shift_d
    range = (3..5000)
    index = []
    range.step(4) do |num|
      index << num
    end
  end
end

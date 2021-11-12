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
    date = date.strftime("%m%d%Y").to_i
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

end

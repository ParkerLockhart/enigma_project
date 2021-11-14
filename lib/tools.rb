require 'date'

module Tools

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
end

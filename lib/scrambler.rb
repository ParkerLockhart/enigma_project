module Scrambler

  def key_generator
    keys = Range.new(0, 99999, exclude_end = false)
    keys = keys.map do |key|
      key.to_s.rjust(5, "0")
    end
    keys.to_a.sample
  end
end

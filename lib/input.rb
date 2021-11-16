class Input
  attr_reader :file_in, :file_out, :key, :date

  def initialize
    @file_in = ARGV[0]
    @file_out = ARGV[1]
    @key = ARGV[2]
    @date = ARGV[3]
  end
end 

env = ENV['APPLICATION_ENV'] || 'development'

require 'bundler/setup'
Bundler.require(:default, env.to_sym)

class Sudoku
  attr_accessor :index, :lines

  def initialize(lines)
    @lines  = lines
    @index  = @lines.shift.first

    validate
  end

  private

  def validate
    fail 'Index less than 1' unless @index >= 1
    fail 'Index greather than 10' unless @index <= 10
  end
end

__END__
puts "\n\n"
puts '#' * 200
p @index
p @lines
puts '#' * 200
puts "\n\n"


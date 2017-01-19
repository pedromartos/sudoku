env = ENV['APPLICATION_ENV'] || 'development'

require 'bundler/setup'
Bundler.require(:default, env.to_sym)

class Sudoku
  attr_accessor :board

  def initialize(board)
    @board = board

    validate
  end

  def valid_lines?
    valid = true

    @board.each do |line|
      unless line.uniq.length == line.length
        valid = false
        break
      end
    end

    valid
  end

  def valid_columns?
    valid = true

    for i in 0..8
      column = @board.map { |line| line[i] }
      unless column.uniq.length == column.length
        valid = false
        break
      end
    end

    valid
  end

  private

  def validate
  end
end

__END__
puts "\n\n"
puts '#' * 200
p @index
p @lines
puts '#' * 200
puts "\n\n"


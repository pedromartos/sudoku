require_relative 'spec_helper'

require_relative  '../code_challenge'

describe CodeChallenge do
  context 'One board' do
    context 'Valid board' do
      it 'returns one word "Valid"' do
        sample = File.new("sample.txt")

        expect { CodeChallenge.new(sample).validate_boards }.to output("Valid\n").to_stdout
      end
    end

    context 'Invalid board' do
      it 'returns one word "Invalid"' do
        sample = File.new("sample_invalid.txt")

        expect { CodeChallenge.new(sample).validate_boards }.to output("Invalid\n").to_stdout
      end
    end
  end

  context 'Multiple boards' do
    context 'Nine valid boards' do
      it 'returns nine word "Valid"' do
        sample = File.new("sample_multiple.txt")
        expectation = "Valid\nValid\nValid\nValid\nValid\nValid\nValid\nValid\nValid\n"

        expect { CodeChallenge.new(sample).validate_boards }.to output(expectation).to_stdout
      end
    end

    context 'First board invalid and rest are valid boards' do
      it 'returns one "Invalid" word and the rest is "Valid"' do
        sample = File.new("sample_multiple_invalid.txt")
        expectation = "Invalid\nValid\nValid\nValid\nValid\nValid\nValid\nValid\nValid\n"

        expect { CodeChallenge.new(sample).validate_boards }.to output(expectation).to_stdout
      end
    end
  end
end

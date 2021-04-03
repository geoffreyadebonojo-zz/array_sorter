require_relative './command_line_output.rb'

class ArgumentProcessor
  attr_reader :args

  def initialize(args)
    @args = args
  end

  def execute
    return CommandLineOutput.missing_args if args.empty? || args[0].empty?

    begin
      @arrays = args.map{|arr| JSON.parse(arr)}
      return_joined_arrays
    rescue
      @arrays = split_arrays.map{|arr| JSON.parse(arr)}
      return_joined_arrays
    rescue
    end
  end

  def split_arrays
    args.first.split(/(?<=[\]])\s*/)
  end

  def return_joined_arrays
    joined_arrays = @arrays.flatten.sort.join(", ")
    "[#{joined_arrays}]"
  end

end

require 'json'
require 'colorize'
require 'pry'

class Sorter

  def self.print_response(args)
    puts sorting_function(args)
  end

  def self.sorting_function(args)
    begin
      parse_input(args)
    rescue
      error_message
    end
  end

  private

  def self.commands
    {
      help:       "--help",
      test:       "--test",
      params:     "--params"
    }
  end

  def self.parse_input(args)
    case args[0]
    when "--help"
      return """
        #{commands[:help].green}             view help options
        #{commands[:test].green}             run test suite
        #{commands[:params].green}           view acceptable arguments
        """

    when "--test"
      cmd = "ruby ./sorter_test.rb".yellow
      return """
      Run tests with: #{cmd}
      """

    when "--params"
      return acceptable_args_example

    else
      process_argument_array(args)
    end
  end

  def self.process_argument_array(args)
    return missing_args_message if args.empty? || args[0].empty?
    begin
      @arrays = args.map{|arr| JSON.parse(arr)}
      return_joined_arrays
    rescue
      @arrays = split_arrays(args).map{|arr| JSON.parse(arr)}
      return_joined_arrays
    rescue
    end
  end

  def self.split_arrays(args)
    args.first.split(/(?<=[\]])\s*/)
  end

  def self.return_joined_arrays
    joined_arrays = @arrays.flatten.sort.join(", ")
    "[#{joined_arrays}]"
  end

  # for incorrect inputs
  def self.missing_args_message
    """
    Please enter an argument string:
    #{acceptable_args_example}
    """
  end

  def self.error_message
    """
    Check how you entered the arguments;
    please, no commas between arrays.
    #{acceptable_args_example}
    """
  end

  def self.acceptable_args_example
    acceptable = "Acceptable (any number of arrays):".green
    unacceptable = "Unacceptable:".red
    """
    --------------------------------------
    #{acceptable}
    Multiple strings  => \"[1,2,3]\" \"[2,3,4]\"
    Single string     => \"[1,2,3] [2,3,4]\"

    #{unacceptable}
    Multiple strings  => \"[1,2,3]\", \"[2,3,4]\"
    Single string     => \"[1,2,3], [2,3,4]\"
    Individual strins => [\"1\", \"2\", \"3\"], [\"2, 3, 4\"]
    --------------------------------------
    """
  end

end

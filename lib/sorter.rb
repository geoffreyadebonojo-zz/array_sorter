require 'json'
require 'colorize'
require 'pry'
require_relative './command_line_output.rb'
require_relative './argument_processor.rb'

class Sorter
  attr_reader :args

  def initialize(args)
    @args = args
  end

  def execute
    begin
      parse_input
    rescue
      CommandLineOutput.error_message
    end
  end

  private

  def parse_input
    if commands.values.include?(args[0])
      method = "#{args[0].gsub("--","")}_option"
      self.send(method)
    else
      process_argument_array
    end
  end

  def process_argument_array
    ArgumentProcessor.new(args).execute
  end

  def commands
    {
      help:   "--help",
      test:   "--test",
      params: "--params"
    }
  end

  def help_option
    """
      #{commands[:help].green}             view help options
      #{commands[:test].green}             run test suite
      #{commands[:params].green}           view acceptable arguments
    """
  end

  def test_option
    system("ruby ./test/sorter_test.rb")
  end

  def params_option
    CommandLineOutput.acceptable_args_example
  end

end

require 'json'
require 'pry'

class Sorter

  def self.sorting_function(args)
    return missing_args if args.empty?
    begin
      parse_input(args)
    rescue
      error_message
    end
  end

  private

  def self.parse_input(args)
    # for correct input "[1,2,3]" "[4,5,6]"
    begin
      @arrays = args.map{|arr| JSON.parse(arr)}
      return_joined_arrays

    # for kinda correct input "[1,2,3] [4,5,6]"
    rescue
      @arrays = split_arrays(args).map{|arr| JSON.parse(arr)}
      return_joined_arrays
    end
  end

  def self.split_arrays(args)
    args.first.split(/(?<=[]])\s*/)
  end

  def self.return_joined_arrays
    joined_arrays = @arrays.flatten.sort.join(", ")
    "[#{joined_arrays}]"
  end

  # for incorrect inputs
  def self.missing_args
    """
    Please enter an argument string:

    #{acceptable_args_example}
    """
  end

  def self.error_message
    """
    --------------------------------------
    Check how you entered the arguments;
    please, no commas between arrays.

    #{acceptable_args_example}
    """

  end

  def self.acceptable_args_example
    '''
    Acceptable (any number of arrays):
    Multiple strings => "[1,2,3]" "[2,3,4]"
    Single string => "[1,2,3] [2,3,4]"

    Unacceptable:
    Multiple strings => "[1,2,3]", "[2,3,4]"
    Single string => "[1,2,3], [2,3,4]"
    --------------------------------------
    '''
  end
end


puts Sorter.sorting_function(ARGV)

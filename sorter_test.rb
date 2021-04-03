require "./sorter.rb"
require "minitest/autorun"


class SorterTest < Minitest::Test

  def test_sorting_function_two_params()
    cmd_line_input = ["[1,5,9]", "[3,4,6]"]
    result = Sorter.sorting_function(cmd_line_input)
    assert result == "[1, 3, 4, 5, 6, 9]"
  end

  def test_sorting_function_more_params()
    cmd_line_input = ["[6,8,9]", "[1,3,5]", "[3,5,6,7,12]"]
    result = Sorter.sorting_function(cmd_line_input)
    assert result == "[1, 3, 3, 5, 5, 6, 6, 7, 8, 9, 12]"
  end

  def test_sorting_function_single_string()
    cmd_line_input = ["[6,8,9] [1,3,5] [3,5,6,7,12]"]
    result = Sorter.sorting_function(cmd_line_input)
    assert result == "[1, 3, 3, 5, 5, 6, 6, 7, 8, 9, 12]"
  end

  def test_error_message()
    cmd_line_input = ["[6,8,9], [1,3,5], [3,5,6,7,12]"]
    result = Sorter.sorting_function(cmd_line_input)
    assert result.include?("Check how you entered the arguments")
  end

  def test_missing_arg_message_array()
    cmd_line_input = []
    result = Sorter.sorting_function(cmd_line_input)
    assert result.include?("Please enter an argument string")
  end

  def test_missing_arg_message_string()
    cmd_line_input = [""]
    result = Sorter.sorting_function(cmd_line_input)
    assert result.include?("Please enter an argument string")
  end

  def test_help_option
    cmd_line_input = ["--help"]
    result = Sorter.sorting_function(cmd_line_input)
    assert result.include?("view help options")
  end

  def test_run_test_option
    cmd_line_input = ["--test"]
    result = Sorter.sorting_function(cmd_line_input)
    assert result.include?("Run tests with")
  end

  def test_show_params_option
    cmd_line_input = ["--params"]
    result = Sorter.sorting_function(cmd_line_input)
    assert result.include?("Acceptable")
  end

end

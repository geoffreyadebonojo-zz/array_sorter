require 'pry'
class CommandLineOutput

  def self.missing_args
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
    zsh = "zsh < 5.5".yellow
    bash = "bash".yellow

    """
    -------------------------------------
    #{acceptable}
    Multiple strings   => \"[1,2,3]\" \"[2,3,4]\"
    Single string      => \"[1,2,3] [2,3,4]\"
    Multiple arrays    =>  [1,2,3] [2,3,4]

    #{unacceptable}
    Multiple strings   => \"[1,2,3]\", \"[2,3,4]\"
    Single string      => \"[1,2,3], [2,3,4]\"
    Multiple arrays    => [1,2,3], [2,3,4]
    Individual strings => [\"1\", \"2\", \"3\"], [\"2, 3, 4\"]
    --------------------------------------

    NOTE: If you're using #{zsh} you won't be able to parse arguments
    passed as arrays. Use string syntax. Or run the commands using #{bash}.
    """
  end

end

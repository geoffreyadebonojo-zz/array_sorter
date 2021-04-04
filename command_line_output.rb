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

  def self.redden(str)
    print str.red
  end

  def self.acceptable_args_example
    acceptable = "Acceptable".green
    unacceptable = "Unacceptable".red
    zsh = "ZSH".yellow
    bash = "BASH".yellow
    q = '"'.green
    l = "[".red
    r = "]".red
    c = ",".red

    """
    --------------#{zsh}--------------------
    #{acceptable}
    Multiple strings                 => #{q}[1,2,3]#{q} #{q}[2,3,4]#{q}
    Single string                    => #{q}[1,2,3] [2,3,4]#{q}
    Spaces OK                        => #{q}[1, 2, 3], [2, 3, 4]#{q}
    #{unacceptable}
    Commas between args BAD          => \"[1,2,3]\"#{c} \"[2,3,4]\"
    Arrays BAD                       =>  #{l}1,2,3#{r} #{l}2,3,4#{r}
    --------------------------------------

    --------------#{bash}--------------------
    #{acceptable}
    Multiple strings                 => \"[1,2,3]\" \"[2,3,4]\"
    Single string                    => \"[1,2,3] [2,3,4]\"
    Multiple arrays                  =>  [1,2,3] [2,3,4]
    #{unacceptable}
    Commas between args BAD          => \"[1,2,3]\"#{c} \"[2,3,4]\"
    Commas between args BAD          =>  [1,2,3]#{c} [2,3,4]
    Spaces BAD                       =>  #{'[1, 2, 3] [2, 3, 4]'.red}
    --------------------------------------

    NOTE: If you're using #{zsh} you won't be able to parse arguments
    passed as arrays. Use string syntax. Or run the commands using #{bash}.
    But be aware that if you pass raw arrays to bash, they must be 
    free of spaces.
    """
  end

end

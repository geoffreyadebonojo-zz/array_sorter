# README

I spent a while trying to figure out if/how to pass actual _arrays_ as arguments to a script from the command line. I remember encountering the same issue when trying to run rake tasks...

Bash doesn't want to accept an array as an argument, but it will accept a string containing an array:

BAD
```bash
  $ruby sorter.rb [1,5,9] [3,4,6]
```

GOOD
```bash
  $ruby sorter.rb "[1,5,9]" "[3,4,6]"
```

You can run tests with: `ruby sorter_test.rb`


## REFERENCES

I considered python:
https://stackoverflow.com/questions/49713149/pass-an-array-as-command-line-argument-to-the-script

Basically the same issue in ruby:
https://stackoverflow.com/questions/24171949/ruby-pass-array-in-command-line-argument

Seems to be a limitation with how bash parses arguments:
https://stackoverflow.com/questions/16461656/how-to-pass-array-as-an-argument-to-a-function-in-bash

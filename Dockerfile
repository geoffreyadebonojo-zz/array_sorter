FROM ruby:latest
RUN gem install colorize
RUN gem install json
RUN gem install minitest

COPY run_sort.rb /
COPY sorter.rb /
COPY argument_processor.rb /
COPY command_line_output.rb /
COPY sorter_test.rb /

RUN chmod +x /run_sort.rb
ENTRYPOINT ["/run_sort.rb"]
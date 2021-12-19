FROM ruby:latest

COPY main.rb .
COPY src/ src/
COPY data/ data/

CMD ["ruby", "main.rb"]

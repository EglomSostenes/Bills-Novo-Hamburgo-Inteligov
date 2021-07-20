FROM ruby:2.6.6

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.1.4
RUN bundle install
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]





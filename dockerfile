FROM ruby:3.0.2

WORKDIR /app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.4.20
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]


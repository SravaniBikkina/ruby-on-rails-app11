# Use an official Ruby runtime as the base image
FROM ruby:3.0.2

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install Rails dependencies
COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.4.20
RUN bundle install

# Copy the Rails application code into the container
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the Rails application server
CMD ["rails", "server", "-b", "0.0.0.0"]


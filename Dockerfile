FROM ruby:3.2

WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev
# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the app
COPY . .

# Precompile assets (optional)
RUN bundle exec rails assets:precompile

# Expose Rails default port
EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]

FROM ruby:3.2

WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev

# Copy Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the app
COPY . .

# Run assets:precompile ONLY in production
ARG RAILS_ENV=development
RUN if [ "$RAILS_ENV" = "production" ]; then bundle exec rails assets:precompile; fi

# Expose Rails default port
EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]

FROM bitwalker/alpine-elixir-phoenix:latest

# Set exposed ports
EXPOSE 4000

# Set the port environment variable
ENV PORT=4000

# Set the MIX_ENV environment variable to production mode
ENV MIX_ENV=prod

# Install yarn
RUN npm i -g yarn

# Set the current working directory to /app
WORKDIR /app

# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

# Set the current working directory to the assets directory
WORKDIR /app/assets

# Add the Node.js related package files
ADD ./assets/package.json ./
ADD ./assets/yarn.lock ./

# Install all Node.js dependencies
RUN yarn install

ADD ./assets/ .

# Run the deploy script for generating the assets
RUN yarn run deploy

# Set the current working directory to /app
WORKDIR /app

# Add the rest of the files
ADD . .

CMD ["mix", "phx.server"]

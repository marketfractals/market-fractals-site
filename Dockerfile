# Use the official Node.js image as a base
FROM node:16-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN yarn build

# Serve the React app with a static server
RUN yarn global add serve
CMD ["serve", "-s", "build"]

# Expose the port
EXPOSE 5000
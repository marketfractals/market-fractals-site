# Use the official Node.js image as a base
FROM node:23

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json yarn.lock ./

#RUN sudo apt install python3-pip
RUN apt-get update && \
    apt-get install -y curl sudo gnupg && \
    sudo apt-get remove -y cmdtest && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    sudo apt-get update && \
    sudo apt-get install -y yarn

RUN yarn install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN yarn build

# Serve the React app with a static server
RUN yarn global add serve
CMD ["serve", "-s", "build"]

# Expose the port
EXPOSE 3000
#!/bin/bash
# Use the official Node.js image as a base
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json into the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code into the working dir
COPY . .

# Build the React application
RUN npm run build


EXPOSE 3000

CMD ["npm", "run", "start"]

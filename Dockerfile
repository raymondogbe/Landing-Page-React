# Use the official Node.js image as a base
FROM node:14 as builder

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

# Use NGINX as a lightweight base image to serve the app
FROM nginx:alpine

# Copy the built app from the previous stage
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80 to the outside world (default for HTTP)
EXPOSE 80

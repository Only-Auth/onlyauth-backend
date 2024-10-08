# Use the official Node.js image as the base image
FROM node:20-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .
RUN npx prisma generate

# Expose the port from environment variable, default to 3000
ARG PORT=3000
ENV PORT $PORT
EXPOSE $PORT

# Command to run the application
CMD ["npm", "start"]
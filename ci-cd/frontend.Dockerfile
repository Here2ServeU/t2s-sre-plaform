# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and install dependencies
COPY frontend/package.json . 
RUN npm install

# Copy the frontend source code
COPY frontend/ .

# Build the React application
RUN npm run build

# Expose port 80
EXPOSE 80

# Start the frontend server
CMD ["npm", "start"]

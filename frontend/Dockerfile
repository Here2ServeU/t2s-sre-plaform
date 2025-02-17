# Dockerfile - Frontend Containerization
FROM node:18-alpine

WORKDIR /app

# Copy package.json and install dependencies
COPY frontend/package.json .
RUN npm install

# Copy the frontend source code
COPY frontend/ .

# Build the React application
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Start the frontend server
CMD ["npm", "start"]

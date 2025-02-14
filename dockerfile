	# Step 1: Use the official Node.js image as a base
FROM node:18.19.1


# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json to install dependencies first
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the entire application code into the container
COPY . .

# Step 6: Build the React application (creates a production-ready build)
RUN npm run build

# Step 7: Install the serve package to serve the static files
RUN npm install -g serve

# Step 8: Expose port 3000 (default port for React app)
EXPOSE 3000

# Step 9: Start the HTTP server to serve the built React app
CMD ["serve", "-s", "build", "-l", "3000"]


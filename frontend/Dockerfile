# Step 1: Use Node.js as the base image
FROM node:18

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application files
COPY . .

# Step 6: Expose the port the app runs on (default React port is 3000)
EXPOSE 3000

# Step 7: Start the application
CMD ["npm", "start"]

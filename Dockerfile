# Step 1: Use an official Node.js image for building the app
FROM node:18 AS build

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application files into the container
COPY . .

# Step 6: Build the React app for production
RUN npm run build

# Step 7: Use an official Nginx image to serve the build files
FROM nginx:stable-alpine

# Step 8: Copy the build files from the previous stage into Nginx's web directory
COPY --from=build /app/build /usr/share/nginx/html

# Step 9: Expose the port Nginx will serve the app on
EXPOSE 80

# Step 10: Start Nginx
CMD ["nginx", "-g", "daemon off;"]

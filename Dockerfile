# Stage 1: Compile and Build angular codebase
# Use official node image as the base image
FROM node:14.16.0 as build
# Set the working directory
WORKDIR /usr/local/app
# Add the source code to app
COPY ./ /usr/local/app/
# Install all the dependencies
RUN npm install
# Generate the build of the application
RUN npm run build
# Stage 2: Serve app with nginx server
# Use official nginx image as the base image
FROM nginx:latest
# Copy the build output to replace the default nginx contents.after dist/ put your angular appln name
COPY --from=build /usr/local/app/dist/angularapp /usr/share/nginx/html
# Expose port 84
EXPOSE 84
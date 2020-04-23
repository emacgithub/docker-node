# Specify a base image
FROM node:alpine

WORKDIR /usr/app

# Install some depenendencies
# Copy package.json by itself.  If it doesn't change then npm install won't need to happen
COPY ./package.json ./
RUN npm install
# Copy the rest of the files after the npm install since any changes to these files will make 
# the rest of the commands not be from cache.  But there isn't any more commands so that is good.
COPY ./ ./

# Default command
CMD ["npm", "start"]
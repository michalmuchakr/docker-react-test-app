# pull official base image
FROM node:16.13 as base_build_for_app

# A directory within the virtualized Docker environment
# Becomes more relevant when using Docker Compose later
WORKDIR /usr/src/app

# Copies source files to Docker environment
COPY . ./

# Installs all node packages
RUN npm install

# Installs all node packages
RUN npm run build

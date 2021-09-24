FROM node:14-alpine

ENV NODE_ENV=production

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]

RUN npm install --production --silent && mv node_modules ../

# Bundle app source
COPY dist .

EXPOSE 8080

RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]
# Stage 1: Build the Vue frontend
FROM node:16-alpine as build-frontend

WORKDIR /app/client

COPY /client/package.json /client/package-lock.json ./

RUN npm install

COPY client .

RUN npm run build

# Stage 2: Set up the server to serve the built Vue files and run the WebSocket server
FROM node:16-alpine

WORKDIR /app

COPY /server/package.json /server/package-lock.json /client/package.json /client/package-lock.json ./

RUN npm install

COPY /server ./server
COPY /client ./client

# Copy the built Vue files to the client's public directory
COPY --from=build-frontend /app/client/dist /app/client/public

EXPOSE 3000
EXPOSE 8080

# Start both the WebSocket server and the client server
CMD ["sh", "-c", "node server/index.js & node client/index.js"]

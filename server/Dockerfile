# Stage 2: Set up the server to serve the built Vue files and run the WebSocket server
FROM node:16-alpine

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

EXPOSE 443

# Start both the WebSocket server and the client server
CMD ["sh", "-c", "node index.js"]
// server/index.js
const express = require('express');
const http = require('http');
const WebSocket = require('ws');
const path = require('path');
const cors = require('cors');
const app = express();
const port = 443;

const server = http.createServer(app);

app.use(cors());

const wss = new WebSocket.Server({ server });

wss.on('connection',(ws) => {
  console.log('New client connected');
  ws.on('message', (message, isBinary) => {
    // Broadcast the message to all clients
    wss.clients.forEach(client => {
      if (client.readyState === WebSocket.OPEN) {
        client.send(message, {binary: isBinary});
      }
    });
  });

  ws.on('close', () => {
    console.log('Client disconnected');
  });
});

server.listen(port, () => {
  console.log('Server is listening on port ' + port );
});

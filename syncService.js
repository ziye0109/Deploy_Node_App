const http = require('http');
const ip = require("ip");
http.createServer(function (req, res) {
  res.write('Node server is listening at 8081...\n');
  res.write('Node server starting syncing data...\n');
  res.write(ip.address());
  res.end(); 
}).listen(8081); 

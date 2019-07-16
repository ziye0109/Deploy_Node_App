const http = require('http');
http.createServer(function (req, res) {
  res.write('Node server is listening at 8081...\n');
  res.write('Node server starting syncing data...\n');
  res.write('AWS secrets are here.');
  res.end(); 
}).listen(8081); 

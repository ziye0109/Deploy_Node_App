const http = require('http');
console.log('Node Server Started!');
http.createServer(function (req, res) {
  res.write('Syncing data between CB and Neptune'); 
  res.end(); 
}).listen(8081); 

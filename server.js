const http = require('http');
console.log('node server started!');
http.createServer(function (req, res) {
  res.write('Syncing data with CB at 8081'); 
  res.end(); 
}).listen(8081); 

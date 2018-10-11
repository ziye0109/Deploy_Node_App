const http = require('http');
console.log('Node Server Started!');
http.createServer(function (req, res) {
  res.write('Node server is listening at 8081...');
  res.write('Node server starting syncing data between CB and Neptune...');
  res.write('Syncing workorders...');
  res.write('Syncing flocs...');
  res.write('Syncing maintance plans...');
  res.end(); 
}).listen(8081); 

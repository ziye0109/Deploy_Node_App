const http = require('http');
console.log('Node Server Started!');
http.createServer(function (req, res) {
  res.write('Node server is listening at 8081...\n');
  res.write('Node server starting syncing data between CB and Neptune...\n');
  res.write('Syncing workorders...\n');
  res.write('Syncing flocs...\n');
  res.write('Syncing maintance plans...\n');
  res.write('Syncing workorders...\n');
  res.end(); 
}).listen(8081); 

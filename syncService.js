const http = require('http');
http.createServer(function (req, res) {
  res.write('Node server is listening at 8081...\n');
  res.write('Node server starting syncing data between CB and Neptune...\n');
  res.write('Syncing workorders...\n');
  res.write('Syncing flocs...\n');
  res.write('Syncing maintance plans...\n');
  res.write('Syncing work centers...\n');
  res.write('Syncing compliance date...\n');
  res.write('Syncing inspectors...\n');
  res.write('Syncing logs...\n');
  res.write('Syncing line of businesses...\n');
  res.write('Syncing divisions...\n');
  res.write('Syncing divisions...\n');
  res.end(); 
}).listen(8081); 

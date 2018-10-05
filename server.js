const http = require('http');

console.log("syncing with engage server!");
http.createServer(function (req, res) {
  res.write('Server is running in docker container at 8081'); 
  res.end(); 
}).listen(8081); 

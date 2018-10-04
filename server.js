const http = require('http');

console.log('start the server!');
http.createServer(function (req, res) {
  res.write('Server is running in docker container!'); 
  res.end(); 
}).listen(8081); 

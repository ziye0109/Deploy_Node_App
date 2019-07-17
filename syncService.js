const http = require('http');

const CLIENT_SECRET = '';

const username = 'ziye';
const SESSION_KEY = '';
const AUTH_TOKEN = ''
const IDENTITY_KEY_PASSPHRASE = '';
const aws_access_key = '';
const aws_account_id = '';

http.createServer(function (req, res) {
  res.write('Node server is listening at 8081...\n');
  res.write('Node server starting syncing data...\n');
  res.write('AWS secrets are here.');
  res.end();
}).listen(8081); 

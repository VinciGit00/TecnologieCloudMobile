const http = require('http')
const url = require('url')

const hostname = '127.0.0.1'
const port = '8080'

const server = http.createServer(function (req, res) {
  console.log("Request Received\n");
  var myurl = new url.URL("http://"+req.headers.host + req.url);
  var params = myurl.searchParams;
  var param_a = "";
  if( params.has("a"))
     param_a = params.get("a");

  var o = new Object();
  o.param_a = param_a;
  var l = new Object();
  for (const [name, value] of params) 
  {
      l[name] = value;
  }
  o.list = l;

  res.statusCode = 200
  res.setHeader('Content-Type', 'application/json')
  res.end(JSON.stringify(o));
});

server.listen(port, hostname, function () {
  console.log(`Server running at http://${hostname}:${port}/`)
})

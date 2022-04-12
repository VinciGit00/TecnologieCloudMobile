const http = require('http')
const url = require('url')
const mongo = require('mongodb')

const hostname = '127.0.0.1'
const port = '8080'

const MIME_json = "application/json";
const MIME_text = "text/plain";
var MIME = MIME_text;
var output_text = "";

const db_name="MyDB_test";
const collection_name = "MyCollection";
const db_url = "mongodb://localhost:27017";

const server = http.createServer(function (req, res) {
  console.log("Request Received\n");
  var myurl = new url.URL("http://"+req.headers.host + req.url);
  var params = myurl.searchParams;

var client_config =
{ useUnifiedTopology: true,
  useNewUrlParser: true };

const client = new mongo.MongoClient(db_url, client_config)

// Connect to the db
client.connect(async function(err) {
 if(err) 
 {
    console.log("Error connecting to MongoDB");
    throw err;
 }
 db = await client.db(db_name);

//Parte quando inserisco valori nel path dal sito
 if( myurl.pathname == "/insert" )
 {
   var o = new Object();
   for (const [name, value] of params) 
   {
    o[name] = value;
   }
  var collection = await db.collection(collection_name);
  var r = await collection.insertOne( o );

  if(r.result.ok == 1 )
  {
   output_text = JSON.stringify( {inserted: 1 } );
   MIME = MIME_json;
  }
  else
  {
   output_text = JSON.stringify( r );
   MIME = MIME_json;
  }
 }

//Parte quando inserisco valori nel path dal sito
 if( myurl.pathname == "/list" )
 {
  var collection = await db.collection(collection_name);
  const docs = await collection.find().limit(10).toArray();
  const total = await collection.find().count();
  var o = new Object();
  o.Total = total;
  o.Selected = 10;
  o.docs = docs;

  output_text = JSON.stringify( o );
  MIME = MIME_json;
 }

  client.close();

  res.statusCode = 200
  res.setHeader('Content-Type', MIME)
  res.end(output_text);     
});

}); // callback di HTTP server

server.listen(port, hostname, function () {
  console.log(`Server running at http://${hostname}:${port}/`)
})

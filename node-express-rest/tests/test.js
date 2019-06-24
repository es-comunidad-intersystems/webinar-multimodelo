// first, load the IRIS connector module inside node_modules
const irisModule = require('iris/iris');

// instantiate a IRIS connector object in JavaScript
var db = new irisModule.IRIS();
console.log('Intersystems IRIS instance: ', db);

// Open the connection to IRIS:
let ok = db.open({
  ip_address: '127.0.0.1',
  tcp_port: 9091,
  username: 'superuser',
  password: '1234',
  namespace: 'USER'
});

console.log('Open result: ', ok);
console.log('Version: ', db.version());

let d = new Date();
// construct a JavaScript global node object to set a test global in the USER namespace
let node = {
  global: 'nodeTest',
  subscripts: [1],
  data: 'At ' + d.toUTCString() + ': global set from Node.js'
};
// set the global in the database
db.set(node);

// retrieve the global contents back from IRIS
let result = db.get(node);

// show it on the console
console.log('Set global ^nodeTest(1) result: ', result);

// close the database connection
db.close();
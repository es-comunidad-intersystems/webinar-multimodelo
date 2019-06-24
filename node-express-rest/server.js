// ----------------------------------
// Application  modules
// ----------------------------------
const db = require('./db/database.js');
const testApi = require('./routes/test.js');

// ----------------------------------
// Create the Express app
// ----------------------------------

const express = require('express');
const app = express();

const cors = require('cors');
var corsOptions = {
    origin: 'http://example.com',
    optionsSuccessStatus: 200
};
app.use(cors(corsOptions));

const bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use('/api/test', testApi);

// ----------------------------------
// Prepare HTTP Server
// ----------------------------------

function onSignal() {
    console.log('\nServer is starting cleanup...');
    // close the database connection
    var result=db.close();
    if (result){
        console.log('IRIS connection closed!')
    } else {
        console.log(result)
    }
}

function onShutdown() {
    console.log('Server is shutting down');
}

async function onHealthCheck() {
    // checks if the system is healthy, like the db connection is live
    // resolves, if health, rejects if not
    console.log('server is checking health');
    return Promise.resolve(
        // optionally include a resolve value to be included as
        // info in the healthcheck response
    )
}

const terminusOptions = {
    signal: 'SIGINT',
    healthChecks: {
        '/healthcheck': onHealthCheck,
    },
    onSignal,
    onShutdown
};

// ----------------------------------
// Create HTTP Server
// ----------------------------------

const http = require('http');
const server = http.createServer(app);

const { createTerminus } = require('@godaddy/terminus');
createTerminus(server, terminusOptions);

const config = require('./config/config.js');

server.listen(config.expressConfig.port, () => {
    db.open(config.irisConfig, (error, result) => {
        if (error) {
            console.log(result);
        } else {
            console.log('IRIS connection opened!');
        }
    });
    console.log('Express web server started!');
});
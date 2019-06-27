const express = require('express');
const router = express.Router();
const db = require('../db/database.js');
const util = require('../core/utils.js');

// Build the node for the right Global
function getNode(id) {
    let node = {
        global: 'test'
    };
    if (id) {
        node.subscripts = new Array();
        node.subscripts.push(id);
    };
    return node;
}

// Retrieve entity from global
function retrieveEntityAt(id) {
    result = db.retrieve(getNode(id), 'object');
    return result.object;
}

// GET /test/:id
// Get object by id
router.get('/:id', function(req, res) {
    db.retrieve(getNode(req.params.id),'object', (error, result) => {
        if (error) {
            res.status(500).send(result);
        } else {
            if (util.isEmptyObject(result.object)) {
                res.status(404).send();
            } else {
                result.object.id = req.params.id;
                res.status(200).send(result.object);
            }
        }
    })
})

// GET /test
// Get all the entities in 'test' global
router.get('/', function (req, res) {
    db.retrieve(getNode(), 'list', (error, result) => {
        if (error) {
            res.status(500).send(result);
        } else {
            var entities = new Array();
            result.forEach(id => {
                let entity = retrieveEntityAt(id);
                entity.id = id;
                entities.push(entity);
            });
            res.status(200).send(entities);
        }
    })
});

// POST /test
// Save new object
router.post('/', function (req, res) {
    // get new id
    var counter = db.increment(getNode());
    if (!counter.ok) {
        res.status(500).send('Cannot get new id');
        return;
    }
    // save object with new id
    let data = {
        node: getNode(counter.data),
        object: req.body
    };
    db.update(data, 'object', (error, result) => {
        if (error) {
            res.status(500).send();
        } else {
            req.body.id = counter.data;
            res.status(201).send(req.body);
        }
    });
});

// POST /test/:id
// Save existing object
router.post('/:id', function (req, res) {
    // check if that id exists
    entity = retrieveEntityAt(req.params.id);
    if (util.isEmptyObject(entity)) {
        res.status(404).send();
    }
    // update object with id
    let data = {
        node: getNode(req.params.id),
        object: req.body
    };
    db.update(data, 'object', (error, result) => {
        if (error) {
            res.status(500).send();
        } else {
            res.status(200).send();
        }
    });    
});

// DELETE /test/:id
// Delete existing object
router.delete('/:id', function (req, res) {
    // check if that id exists
    entity = retrieveEntityAt(req.params.id);
    if (util.isEmptyObject(entity)) {
        res.status(404).send();
    }
    // delete object with id
    db.kill(getNode(req.params.id), (error, result) => {
        if (error) {
            res.status(500).send();
        } else {
            res.status(200).send();
        }
    });    
});

module.exports = router;
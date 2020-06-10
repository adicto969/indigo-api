var configDB = require('./database');
var Knex = require('knex')(configDB);
var BookShelf = require('bookshelf')(Knex);


module.exports = BookShelf;
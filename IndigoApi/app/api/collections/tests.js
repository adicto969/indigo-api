var BookShelf = require('../../../config/bookshelf');
var Test = require('../models/test');

var Tests = BookShelf.Collection.extend({
    model: Test
});

module.exports = Tests;
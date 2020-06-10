var BookShelf = require('../../../config/bookshelf');
var TestModel = require('../models/test-model');

var TestModels = BookShelf.Collection.extend({
    model: TestModel
});

module.exports = TestModels;
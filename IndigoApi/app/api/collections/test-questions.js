var BookShelf = require('../../../config/bookshelf');
var TestQuestion = require('../models/test-question');

var TestQuestions = BookShelf.Collection.extend({
    model: TestQuestion
});

module.exports = TestQuestions;
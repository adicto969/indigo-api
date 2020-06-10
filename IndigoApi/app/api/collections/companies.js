var BookShelf = require('../../../config/bookshelf');
var Company = require('../models/company');

var Companies = BookShelf.Collection.extend({
    model: Company
});

module.exports = Companies;
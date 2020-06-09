var BookShelf = require('../../../config/bookshelf');
var Currency = require('../models/currency');

var Currencies = BookShelf.Collection.extend({
    model: Currency
});

module.exports = Currencies;
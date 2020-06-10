var BookShelf = require('../../../config/bookshelf');
var Product = require('../models/product');

var Products = BookShelf.Collection.extend({
    model: Product
});

module.exports = Products;
var BookShelf = require('../../../config/bookshelf');
var Moneda = require('../models/moneda');

var Monedas = BookShelf.Collection.extend({
    model: Moneda
});

module.exports = Monedas;
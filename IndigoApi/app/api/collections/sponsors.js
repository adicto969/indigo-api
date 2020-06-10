var BookShelf = require('../../../config/bookshelf');
var Sponsor = require('../models/sponsor');

var Sponsors = BookShelf.Collection.extend({
    model: Sponsor
});

module.exports = Sponsors;
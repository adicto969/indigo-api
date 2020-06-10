var BookShelf = require('../../../config/bookshelf');
var UserType = require('../models/user-type');

var UserTypes = BookShelf.Collection.extend({
    model: UserType
});

module.exports = UserTypes;
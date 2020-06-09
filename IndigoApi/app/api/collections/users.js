var BookShelf = require('../../../config/bookshelf');
var User = require('../models/user');

var Users = BookShelf.Collection.extend({
    model: User
});

module.exports = Users;
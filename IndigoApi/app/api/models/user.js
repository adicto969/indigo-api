var BookShelf = require('../../../config/bookshelf');
BookShelf.plugin('registry');


var User = BookShelf.Model.extend({
    tableName: 'usuarios',
    hasTimestamps: true
});

module.exports = BookShelf.model('User', User);
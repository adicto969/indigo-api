var BookShelf = require('../../../config/bookshelf');
BookShelf.plugin('registry');

  
var UserType = BookShelf.Model.extend({
    tableName: 'UserTypes',
    hasTimestamps: true,
    idAttribute: 'Id'
});

module.exports = BookShelf.model('UserType', UserType);
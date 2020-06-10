var BookShelf = require('../../../config/bookshelf');
var validator = require('validator');

validator.isRequired = function (val) {
    return val != null;
}

BookShelf.plugin('bookshelf-validate', {
    validator: validator,
    validateOnSave: true
});


var User = BookShelf.Model.extend({
    tableName: 'Users',
    hasTimestamps: true,
    idAttribute: 'Id',
    validations: {
        FirsName: 'isRequired',
        CompanyId: 'isRequired',
        RFC: "isRequired",
        Mail: "isRequired"
    }
});

module.exports = BookShelf.model('User', User);
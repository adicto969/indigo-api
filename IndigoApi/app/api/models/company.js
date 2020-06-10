var BookShelf = require('../../../config/bookshelf');
var validator = require('validator');

validator.isRequired = function (val) {
    return val != null;
  }

BookShelf.plugin('bookshelf-validate', {
    validator: validator,
    validateOnSave: true
});

  
var Company = BookShelf.Model.extend({
    tableName: 'Companies',
    hasTimestamps: true,
    idAttribute: 'Id',
    validations: {
        Name: 'isRequired',
        BusinessName: 'isRequired',
        RFC: 'isRequired',
        SponsorId: 'isRequired'
      }
});

module.exports = BookShelf.model('Company', Company);
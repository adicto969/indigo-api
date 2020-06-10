var BookShelf = require('../../../config/bookshelf');
var validator = require('validator');

validator.isRequired = function (val) {
    return val != null;
  }

BookShelf.plugin('bookshelf-validate', {
    validator: validator,
    validateOnSave: true
});

  
var Sponsor = BookShelf.Model.extend({
    tableName: 'Sponsors',
    hasTimestamps: true,
    idAttribute: 'Id',
    validations: {
        Name: 'isRequired',
        BusinessName: 'isRequired',
        RFC: 'isRequired'
      }
});

module.exports = BookShelf.model('Sponsor', Sponsor);
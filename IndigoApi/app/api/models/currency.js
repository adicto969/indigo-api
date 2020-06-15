var BookShelf = require('../../../config/bookshelf');
var validator = require('validator');

validator.isRequired = function (val) {
    return val != null;
  }

BookShelf.plugin('bookshelf-validate', {
    validator: validator,
    validateOnSave: true
});

  
var Currency = BookShelf.Model.extend({
    tableName: 'Currencies',
    hasTimestamps: true,
    idAttribute: 'Id',
    validations: {
        code: 'isRequired',
        name: 'isRequired'
      }
});

module.exports = BookShelf.model('Currency', Currency);
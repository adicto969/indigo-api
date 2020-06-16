var BookShelf = require('../../../config/bookshelf');
var validator = require('validator');

validator.isRequired = function (val) {
    return val != null;
  }

BookShelf.plugin('bookshelf-validate', {
    validator: validator,
    validateOnSave: true
});

  
var Product = BookShelf.Model.extend({
    tableName: 'Products',
    hasTimestamps: true,
    validations: {
        Name: 'isRequired',
        CurrencyId: 'isRequired',
        Price: 'isRequired'
      }
});

module.exports = BookShelf.model('Product', Product);
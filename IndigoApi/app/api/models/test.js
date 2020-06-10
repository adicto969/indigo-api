var BookShelf = require('../../../config/bookshelf');
var validator = require('validator');

validator.isRequired = function (val) {
    return val != null;
  }

BookShelf.plugin('bookshelf-validate', {
    validator: validator,
    validateOnSave: true
});

  
var Test = BookShelf.Model.extend({
    tableName: 'Tests',
    hasTimestamps: true,
    idAttribute: 'Id',
    validations: {
        Name: 'isRequired',
        TestModelId: 'isRequired',
        ProductId: 'isRequired',
        CompanyId: 'isRequired',
        StartDate: 'isRequired',
        EndDate: 'isRequired'
      }
});

module.exports = BookShelf.model('Test', Test);
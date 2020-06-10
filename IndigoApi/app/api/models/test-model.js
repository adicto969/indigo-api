var BookShelf = require('../../../config/bookshelf');
var validator = require('validator');

validator.isRequired = function (val) {
    return val != null;
  }

BookShelf.plugin('bookshelf-validate', {
    validator: validator,
    validateOnSave: true
});

  
var TestModel = BookShelf.Model.extend({
    tableName: 'TestModels',
    hasTimestamps: true,
    idAttribute: 'Id',
    validations: {
        Code: 'isRequired',
        Name: 'isRequired',
      }
});

module.exports = BookShelf.model('TestModel', TestModel);
var BookShelf = require('../../../config/bookshelf');
var validator = require('validator');

validator.isRequired = function (val) {
    return val != null;
  }

BookShelf.plugin('bookshelf-validate', {
    validator: validator,
    validateOnSave: true
});


  
var TestQuestion = BookShelf.Model.extend({
    tableName: 'TestQuestions',
    hasTimestamps: true,
    idAttribute: 'Id',
    validations: {
        TestId: 'isRequired',
        Question: 'isRequired',
        LevelQuestion: 'isRequired'
      }
});

module.exports = BookShelf.model('TestQuestion', TestQuestion);
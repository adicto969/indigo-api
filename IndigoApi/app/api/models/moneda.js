var BookShelf = require('../../../config/bookshelf');
var validator = require('validator');

validator.isRequired = function (val) {
    return val != null;
  }

//BookShelf.plugin('registry');
BookShelf.plugin('bookshelf-validate', {
    validator: validator,
    validateOnSave: true
});

  
var Moneda = BookShelf.Model.extend({
    tableName: 'monedas',
    hasTimestamps: true,
    validations: {
        prueba: 'isRequired',
        Nombre: 'isRequired',
        Enabled: 'isRequired'
      }
});

module.exports = BookShelf.model('Moneda', Moneda);
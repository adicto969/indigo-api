var Moneda = require('../models/moneda');
var Monedas = require('../collections/monedas');

module.exports = {
    create: function(req, res){
        Moneda.forge({
            Nombre: req.body.Nombre, 
            Enabled: req.body.Enabled,
            prueba: req.body.prueba
        })
        .save()
        .then(function (moneda){
            res.json({status: "Ok", message: "Moneda agregado exitosamente!", data: null})
        })
        .catch(function(err){
            res.status(500).json({status: "error", message: err.message, data: null})
        })
    }
}
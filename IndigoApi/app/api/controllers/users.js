const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const saltRounds = 10;

var User = require('../models/user');
var Users = require('../collections/users');

module.exports = {
    create: function(req, res){
        User.forge({
            name_complete: req.body.nombre, 
            email: req.body.email,
            password: bcrypt.hashSync(req.body.password, saltRounds)
        })
        .save()
        .then(function (user){
            res.json({status: "Ok", message: "¡Usuario agregado exitosamente!", data: null})
        })
        .catch(function(err){
            res.status(500).json({status: "error", message: err.message, data: null})
        })
    },
    authenticate: function(req, res){
        User.forge({
            email: req.body.email
        })
        .fetch()
        .then(function(user){
            if (!user){
                res.status(404).json({status: "not found", message: "Usuario no encontrado", data: null})
            }
            else{
                if (bcrypt.compareSync(req.body.password, user.toJSON().password)){
                    const token = jwt.sign({Id: user.toJSON().Id}, req.app.get('secretKey'), {expiresIn: '1h'});
                    res.json({status: 'Ok', message: "¡El usuario ha sido autenticado!", data:{user: user.toJSON(), token: token}});
                }
                else
                    res.json({status: "error", message: "Password inválido!", data: null});
            }
        })
        .catch(function(err){
            res.status(500).json({status: "error", message: err.message, data: null})
        })
    }
}
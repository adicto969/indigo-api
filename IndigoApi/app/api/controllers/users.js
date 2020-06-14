const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const saltRounds = 10;

var User = require('../models/user');
var Users = require('../collections/users');

module.exports = {
    /*create: function (req, res) {
        User.forge({
            name_complete: req.body.nombre,
            email: req.body.email,
            password: bcrypt.hashSync(req.body.password, saltRounds)
        })
            .save()
            .then(function (model) {
                res.json({ status: "Ok", message: "¡Usuario agregado exitosamente!", data: model })
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null })
            })
    },*/
    get: function (req, res) {
        Users.forge()
            .fetch()
            .then(function (collection) {
                res.json({ status: "Ok", message: "List of Users!", data: collection });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    getById: function (req, res) {
        User.forge({
            Id: req.params.id
        })
            .fetch()
            .then(function (model) {
                if (!model)
                    res.status(404).json({ status: "notfound", message: "User not found", data: null });
                else
                    res.json({ status: "Ok", message: "Test Model found!", data: model });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    getActive: function (req, res) {
        Users.query({ where: { Enabled: true } })
            .fetch()
            .then(function (collection) {
                res.json({ status: "Ok", message: collection.length > 0 ? " Users found!" : "Empty List", data: collection });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    filter: function (req, res) {
        Users.forge()
            .fetchPage({
                pageSize: req.params.pageSize,
                page: req.params.page
            })
            .then(function (collection) {
                res.json({ status: "Ok", message: "List of Companies!", data: collection });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    create: function (req, res) {
        req.body.Password = bcrypt.hashSync(req.body.Password, saltRounds)

        User.forge(req.body)
            .save()
            .then(function (model) {
                res.json({ status: "Ok", message: "User added sucessfully!", data: model });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    update: function (req, res) {
        User.forge({
            Id: req.params.id
        })
            .fetch({ require: true })
            .then(function (model) {
                model.save(req.body)
                    .then(function () {
                        res.json({ status: "Ok", message: "User update sucessfully!", data: model });
                    })
                    .catch(function (err) {
                        res.status(500).json({ status: "error", message: err.message, data: null });
                    })
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    authenticate: function (req, res) {
        User.forge({
            Mail: req.body.Mail
        })
            .fetch()
            .then(function (model) {
                if (!model) {
                    res.status(404).json({ status: "not found", message: "User Not Found", data: null })
                }
                else {
                    if (bcrypt.compareSync(req.body.Password, model.toJSON().Password)) {
                        const token = jwt.sign({ Id: model.toJSON().Id }, req.app.get('secretKey'), { expiresIn: '1h' });
                        res.json({ status: 'Ok', message: "Authenticate User!", data: { user: model.toJSON(), token: token } });
                    }
                    else
                        res.json({ status: "error", message: "Invalid Password!", data: null });
                }
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null })
            })
    }
}
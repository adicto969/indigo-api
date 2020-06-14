var Currency = require('../models/currency');
var Currencies = require('../collections/currencies');

module.exports = {
    get: function (req, res) {
        Currencies.forge()
            .fetch()
            .then(function (collection) {
                res.json({ status: "Ok", message: "List of currencies!", data: collection });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    getById: function (req, res) {
        Currency.forge({
            Id: req.params.id
        })
            .fetch()
            .then(function (model) {
                if (!model)
                    res.status(404).json({ status: "notfound", message: "Currency not found", data: null });
                else
                    res.json({ status: "Ok", message: "Currency found!", data: model });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    getActive: function (req, res) {
        Currencies.query({ where: { Enabled: true } })
            .fetch()
            .then(function (collection) {
                res.json({ status: "Ok", message: collection.length > 0 ? " Currencies found!" : "Empty List", data: collection });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    create: function (req, res) {
        Currency.forge(req.body)
            .save()
            .then(function (model) {
                res.json({ status: "Ok", message: "Currency added sucessfully!", data: model });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    update: function (req, res) {
        Currency.forge({
            Id: req.params.id
        })
            .fetch({ require: true })
            .then(function (model) {
                model.save(req.body)
                    .then(function () {
                        res.json({ status: "Ok", message: "Currency update sucessfully!", data: model });
                    })
                    .catch(function (err) {
                        res.status(500).json({ status: "error", message: err.message, data: null });
                    })
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    }
}
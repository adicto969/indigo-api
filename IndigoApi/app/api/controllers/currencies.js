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
            .then(function (currency) {
                if (!currency)
                    res.status(404).json({ status: "notfound", message: "Currency not found", data: null });
                else
                    res.json({ status: "Ok", message: "Currency found!", data: currency.toJSON() });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    create: function (req, res) {
        Currency.forge({
            Code: req.body.Code,
            Name: req.body.Name,
            Enabled: req.body.Enabled
        })
            .save()
            .then(function (currency) {
                res.json({ status: "Ok", message: "Currency added sucessfully!", data: currency });
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
            .then(function (currency) {
                currency.save({
                    Code: req.body.Code || currency.get('Code'),
                    Name: req.body.Name || currency.get('Name'),
                    Enabled: req.body.Enabled || currency.get('Enabled')
                })
                    .then(function () {
                        res.json({ status: "Ok", message: "Currency update sucessfully!", data: currency });
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
var Sponsor = require('../models/sponsor');
var Sponsors = require('../collections/sponsors');

module.exports = {
    get: function (req, res) {
        Sponsors.forge()
            .fetch()
            .then(function (collection) {
                res.json({ status: "Ok", message: "List of Sponsors!", data: collection });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    getById: function (req, res) {
        Sponsor.forge({
            Id: req.params.id
        })
            .fetch()
            .then(function (model) {
                if (!model)
                    res.status(404).json({ status: "notfound", message: "Sponsor not found", data: null });
                else
                    res.json({ status: "Ok", message: "Sponsor found!", data: model });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    create: function (req, res) {
        Sponsor.forge(req.body)
            .save()
            .then(function (model) {
                res.json({ status: "Ok", message: "Sponsor added sucessfully!", data: model });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    update: function (req, res) {
        Sponsor.forge({
            Id: req.params.id
        })
            .fetch({ require: true })
            .then(function (model) {
                model.save(req.body)
                    .then(function () {
                        res.json({ status: "Ok", message: "Sponsor update sucessfully!", data: model });
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
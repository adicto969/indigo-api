var TestModel = require('../models/test-model');
var TestModels = require('../collections/test-models');

module.exports = {
    get: function (req, res) {
        TestModels.forge()
            .fetch()
            .then(function (collection) {
                res.json({ status: "Ok", message: "List of Test Models!", data: collection });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    getById: function (req, res) {
        TestModel.forge({
            Id: req.params.id
        })
            .fetch()
            .then(function (model) {
                if (!model)
                    res.status(404).json({ status: "notfound", message: "Test Model not found", data: null });
                else
                    res.json({ status: "Ok", message: "Test Model found!", data: model });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    getActive: function (req, res) {
        TestModels.query({ where: { Enabled: true } })
            .fetch()
            .then(function (collection) {
                res.json({ status: "Ok", message: collection.length > 0 ? " Currencies found!" : "Empty List", data: collection });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    create: function (req, res) {
        TestModel.forge(req.body)
            .save()
            .then(function (model) {
                res.json({ status: "Ok", message: "Test Model added sucessfully!", data: model });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    update: function (req, res) {
        TestModel.forge({
            Id: req.params.id
        })
            .fetch({ require: true })
            .then(function (model) {
                model.save(req.body)
                    .then(function () {
                        res.json({ status: "Ok", message: "Test Model update sucessfully!", data: model });
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
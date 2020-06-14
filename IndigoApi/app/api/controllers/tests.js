var Test = require('../models/test');
var Tests = require('../collections/tests');

module.exports = {
    get: function (req, res) {
        Tests.forge()
            .fetch()
            .then(function (collection) {
                res.json({ status: "Ok", message: "List of Tests!", data: collection });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    getById: function (req, res) {
        Test.forge({
            Id: req.params.id
        })
            .fetch()
            .then(function (model) {
                if (!model)
                    res.status(404).json({ status: "notfound", message: "Company not found", data: null });
                else
                    res.json({ status: "Ok", message: "Test found!", data: model });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    getActive: function (req, res) {
        Tests.query({ where: { Enabled: true } })
            .fetch()
            .then(function (collection) {
                res.json({ status: "Ok", message: collection.length > 0 ? "Tests found!" : "Empty List", data: collection });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    filter: function (req, res) {
        Tests.forge()
            .fetchPage({
                pageSize: req.params.pageSize,
                page: req.params.page
            })
            .then(function (collection) {
                res.json({ status: "Ok", message: "List of Tests!", data: collection });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    create: function (req, res) {
        Test.forge(req.body)
            .save()
            .then(function (model) {
                res.json({ status: "Ok", message: "Test added sucessfully!", data: model });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    update: function (req, res) {
        Test.forge({
            Id: req.params.id
        })
            .fetch({ require: true })
            .then(function (model) {
                model.save(req.body)
                    .then(function () {
                        res.json({ status: "Ok", message: "Test update sucessfully!", data: model });
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
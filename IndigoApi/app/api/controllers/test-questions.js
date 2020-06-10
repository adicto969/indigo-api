var TestQuestion = require('../models/test-question');
var TestQuestions = require('../collections/test-questions');


module.exports = {
    get: function (req, res) {
        TestQuestions.forge()
            .fetch()
            .then(function (collection) {
                res.json({ status: "Ok", message: "List of Questions!", data: collection });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    getById: function (req, res) {
        TestQuestion.forge({
            Id: req.params.id
        })
            .fetch()
            .then(function (model) {
                if (!model)
                    res.status(404).json({ status: "notfound", message: "Question not found", data: null });
                else
                    res.json({ status: "Ok", message: "Question found!", data: model });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    getByTest: function (req, res) {
        TestQuestions.query({
            where: {TestId: req.params.id}
        })
            .fetch()
            .then(function (collection) {
                res.json({ status: "Ok", message: collection.length > 0 ? "Questions found!" : "Empty List", data: collection });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    createList: function (req, res) {
        TestQuestions.forge(req.body).invokeThen('save')
            .then(function (collection) {
                res.json({ status: "Ok", message: "Questions added sucessfully!", data: collection });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
        /*let list = [];
        console.log(req.body);
        req.body.forEach(p => {
            TestQuestion.forge(p)
                .save()
                .then(function (model) {
                    list.push(model);
                })
                .catch(function (err) {
                    res.status(500).json({ status: "error", message: err.message, data: null });
                })
        });

        res.json({ status: "Ok", message: "Question added sucessfully!", data: list });*/
    },
    create: function (req, res) {
        TestQuestion.forge(req.body)
            .save()
            .then(function (model) {
                res.json({ status: "Ok", message: "Question added sucessfully!", data: model });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    },
    update: function (req, res) {
        TestQuestion.forge({
            Id: req.params.id
        })
            .fetch({ require: true })
            .then(function (model) {
                model.save(req.body)
                    .then(function () {
                        res.json({ status: "Ok", message: "Question update sucessfully!", data: model });
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
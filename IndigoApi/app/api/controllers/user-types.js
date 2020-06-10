var UserType = require('../models/user-type');
var UserTypes = require('../collections/user-types');

module.exports = {
    get: function (req, res) {
        UserTypes.forge()
            .fetch()
            .then(function (collection) {
                res.json({ status: "Ok", message: "List of User Types!", data: collection });
            })
            .catch(function (err) {
                res.status(500).json({ status: "error", message: err.message, data: null });
            })
    }
}
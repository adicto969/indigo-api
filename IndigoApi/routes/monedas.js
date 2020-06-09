const express = require('express');
const router = express.Router();
const monedaController = require('../app/api/controllers/monedas');

router.post('/', monedaController.create);
module.exports = router;
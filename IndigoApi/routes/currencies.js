const express = require('express');
const router = express.Router();
const currencyController = require('../app/api/controllers/currencies');

router.get('/', currencyController.get);
router.get('/:id', currencyController.getById);
router.post('/', currencyController.create);
router.put('/:id', currencyController.update);
module.exports = router;
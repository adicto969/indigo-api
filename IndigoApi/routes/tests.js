const express = require('express');
const router = express.Router();
const modelController = require('../app/api/controllers/tests');

router.get('/', modelController.get);
router.get('/:id', modelController.getById);
router.post('/', modelController.create);
router.put('/:id', modelController.update);
module.exports = router;
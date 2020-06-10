const express = require('express');
const router = express.Router();
const modelController = require('../app/api/controllers/users');

router.get('/', modelController.get);
router.get('/:id', modelController.getById);
router.post('/', modelController.create);
router.put('/:id', modelController.update);
router.post('/authenticate', modelController.authenticate);
module.exports = router;
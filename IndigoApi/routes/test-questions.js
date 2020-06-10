const express = require('express');
const router = express.Router();
const modelController = require('../app/api/controllers/test-questions');

router.get('/', modelController.get);
router.get('/:id', modelController.getById);
router.get('/getbytest/:id', modelController.getByTest);
router.post('/', modelController.create);
router.post('/savelist', modelController.createList);
router.put('/:id', modelController.update);
module.exports = router;
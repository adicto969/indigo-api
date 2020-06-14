const express = require('express');
const router = express.Router();
const modelController = require('../app/api/controllers/currencies');

router.get('/', modelController.get);
router.get('/getactives', modelController.getActive);
router.get('/:id', modelController.getById);
router.post('/', modelController.create);
router.put('/:id', modelController.update);
module.exports = router;
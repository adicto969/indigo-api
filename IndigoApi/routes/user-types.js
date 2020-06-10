const express = require('express');
const router = express.Router();
const modelController = require('../app/api/controllers/user-types');

router.get('/', modelController.get);
module.exports = router;
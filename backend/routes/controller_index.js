const express = require('express')
const router = express.Router()

const userController = require('../controller/user_controller')

router.post('/login', userController.login)
router.post('/signUp', userController.signUp)

module.exports = router;
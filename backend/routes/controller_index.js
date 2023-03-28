const express = require('express')
const route = express.Router()

const UserController = require('../controller/user_controller')
const NitnemController = require('../controller/nitnem_controller')
const GoodBehaviourController = require('../controller/good_behaviour_controller')
route.post('/login', UserController.login)
route.post('/signUp', UserController.signUp)
route.post('/fetchNitnemTask', NitnemController.fetchTask)
route.post('/fetchGoodBehaviourTask', GoodBehaviourController.fetchTask)

module.exports = route;
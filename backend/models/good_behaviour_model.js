const mongoose = require('mongoose')
const Schema = mongoose.Schema

var GoodBehaviourSchema =  mongoose.Schema({
    name:{
        type:String,
        required: true
    },
    
})

var NitnemSchema = mongoose.model('goodbehaviourtask', GoodBehaviourSchema, 'goodbehaviourtask'); 
module.exports = GoodBehaviourSchema;
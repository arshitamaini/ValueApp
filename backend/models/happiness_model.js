const mongoose = require('mongoose')
const Schema = mongoose.Schema

var HappinessSchema =  mongoose.Schema({
    taskTitle:{
        type:String,
        required: true
    },
    taskDescription:{
        type:String,
        required:true
    },
    userId:{
        type:String,
        required:true
    }
})

var HappinessSchema = mongoose.model('happinesstask', HappinessSchema, 'happinesstask'); 
module.exports = HappinessSchema; 

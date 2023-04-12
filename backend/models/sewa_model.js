const mongoose = require('mongoose')
const Schema = mongoose.Schema

var SewaSchema =  mongoose.Schema({
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

var SewaSchema = mongoose.model('sewatask', SewaSchema, 'sewatask'); 
module.exports = SewaSchema; 

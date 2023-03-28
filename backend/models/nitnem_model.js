const mongoose = require('mongoose')
const Schema = mongoose.Schema

var NitnemSchema =  mongoose.Schema({
    name:{
        type:String,
        required: true
    },
    gurmukhiContent:{
        type:String
    },
    hindiContent:{
        type:String
    },
    englishContent:{
        type:String
    }
    
})

var NitnemSchema = mongoose.model('nitnemtask', NitnemSchema, 'nitnemtask'); 
module.exports = NitnemSchema; 

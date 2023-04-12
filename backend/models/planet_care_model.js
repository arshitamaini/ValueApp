const mongoose = require('mongoose')
const Schema = mongoose.Schema

var PlanetCareSchema =  mongoose.Schema({
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

var PlanetCareSchema = mongoose.model('planetaretask', PlanetCareSchema, 'planetcaretask'); 
module.exports = PlanetCareSchema; 

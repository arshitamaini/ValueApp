const mongoose = require('mongoose')
const Schema = mongoose.Schema

var GoodBehaviourSchema =  mongoose.Schema({
    name:{
        type:String,
        required: true
    },
    image:{
        data: Buffer,
        contentType: String,
    }
    
    
})

var GoodBehaviourSchema = mongoose.model('goodbehaviourtask', GoodBehaviourSchema, 'goodbehaviourtask'); 
module.exports = GoodBehaviourSchema;

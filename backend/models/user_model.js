const mongoose = require('mongoose')
const Schema = mongoose.Schema

const userSchema = new Schema({
    name:{
        type:String
    },
    userCategory:{
        type:String
    },
    phoneNumber:{
        type:Number
    },
    

})

mongoose.export =  User = mongoose.model('User', newSchema)
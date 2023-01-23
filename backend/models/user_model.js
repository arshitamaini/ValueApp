const mongoose = require('mongoose')
const Schema = mongoose.Schema

const userSchema = new Schema({
    name:{
        type:String
    },
    password:{
        type:String
    },
    phoneNumber:{
        type:Number
    },
    email:{
        type:String
    },
})

mongoose.export =  User = mongoose.model('User', userSchema)
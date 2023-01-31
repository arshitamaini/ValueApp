const mongoose = require('mongoose')
const Schema = mongoose.Schema

var UserSchema = mongoose.Schema({
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

var UserSchema = mongoose.model('users', UserSchema, 'users'); 
module.exports = UserSchema; 

// mongoose.export =  User = mongoose.model('User', userSchema)
const mongoose = require('mongoose')
const Schema = mongoose.Schema

var UserSchema =  mongoose.Schema({
    firstName:{
        type:String,
        required: true
    },
    lastName:{
        type:String,
        required: true
    },
    emailPhoneNumber:{
        type:String,
        required: true
    },
    password:{
        type:String,
        required: true
    },
})

var UserSchema = mongoose.model('users', UserSchema, 'users'); 
module.exports = UserSchema; 

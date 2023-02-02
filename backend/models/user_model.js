const mongoose = require('mongoose')
const Schema = mongoose.Schema

var UserSchema =  mongoose.Schema({
    name:{
        type:String,
        required: true
    },
    password:{
        type:String,
        required: true
    },
    phoneNumber:{
        type:String,
        required: true
    },
    email:{
        type:String,
        required: true
    },
})

var UserSchema = mongoose.model('users', UserSchema, 'users'); 
module.exports = UserSchema; 

// mongoose.export =  User = mongoose.model('User', userSchema)

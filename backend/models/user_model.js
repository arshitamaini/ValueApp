const mongoose = require('mongoose')
const Schema = mongoose.Schema

var userSchema =  mongoose.Schema({
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

var userSchema = mongoose.model("user", userSchema, "user");
module.exports = userSchema
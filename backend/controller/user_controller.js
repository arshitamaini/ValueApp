//const User = require('../models/user_model')
const { json } = require('body-parser')
const { trusted } = require('mongoose')
const Cryptr = require('cryptr');
const { UserController } = require('moongose/controller');
const cryptr = new Cryptr('ValueAppKey12345', { pbkdf2Iterations: 10000, saltLength: 10 });

const userModel = require('../models/user_model')


var userController = {

    login : async function(req,res) { 
        userModel.findOne({phoneNumber:req.body.phoneNumber}, (err,user)=>{
            if(err){
                console.log(err)
                res.json({ 'success': false, 'message': 'Something went wrong, please try again later ', code: 500, info:{} })
            }else{
                if(user == null){
                    res.json({ 'success': false, 'message': 'Account Not Found, Please SignIn', code: 500, info:{} })
                }else{
                    user = JSON.parse(JSON.stringify(user))
                    decryptedPassword = cryptr.decrypt(user.password)
                    
                    if(decryptedPassword == req.body.password){
                        console.log(user)
                        res.json({ 'success': true, 'message': 'Login Successful', code: 500, info : user  })
                    }else{
                        console.log('incorrectPasword' )
                        res.json({ 'success': false, 'message': 'Incorrect password or phone number ', code: 500, info:{} })
                    }
    
                }
               
    
               
            }
        })
    },

    signUp : async function(req,res) {
        try{   
         userModel.findOne({phoneNumber:req.body.phoneNumber}, (err,user)=>{
            if(err){    
                console.log(err)
                res.json({ 'success': false, 'message': 'Something went wrong, please try again later ', code: 500, info:{} })
            }else{
                if(user ==  null){
                    encryptedPassword= cryptr.encrypt(req.body.password);
                    const user = userModel({
                        phoneNumber: req.body.phoneNumber,
                        password: encryptedPassword,
                        name: req.body.name,
                        email:req.body.email,
                    })
                    user.save(async function(err, userData) {
                        if(err){
                        console.log(err) 
                          res.json({'success':false, 'message': 'something went wrong', code : 500, info: {}});
                        }
                      else{
                        res.json({'success':true, 'message':'Account created successfully', code:200,  info:userData});
                      }
                        
                    })
                }else{
                     res.json({'success': false,'message':'Account Already exists', code:500, info:{}})
                }
            }
        })}
        catch(e){
            console.log('error'+e)
            res.json({'success': false,'message':e, code:500, info:{}})
          
        }
    }
}

module.exports = userController
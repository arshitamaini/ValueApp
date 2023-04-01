const userModel = require('../models/user_model')

var UserController = {

    login : async function(req,res) { 
        console.log(req.body.emailPhoneNumber)
        userModel.findOne({emailPhoneNumber:req.body.emailPhoneNumber}, (err,user)=>{
            
            if(err){
                console.log(err)
                res.json({ 'success': false, 'message': 'Something went wrong, please try again later ', code: 500, info:{} })
            }else{
                if(user == null){
                    res.json({ 'success': false, 'message': 'Account Not Found, Please SignIn', code: 500, info:{} })
                    console.log({ 'success': false, 'message': 'Account Not Found, Please SignIn', code: 500, info:{} })
                }else{
                    user = JSON.parse(JSON.stringify(user))

                    if(user.password == req.body.password) {
                        res.json({ 'success': true, 'message': 'Login Successful', code: 500, info : user  })
                        console.log({ 'success': true, 'message': 'Login Successful', code: 500, info : user})
                    } else {
                        res.json({ 'success': false, 'message': 'Incorrect password or phone number ', code: 500, info:{} })
                    }
                }
               
    
               
            }
        })
    },

    signUp : async function(req,res) {
        try{   
         userModel.findOne({emailPhoneNumber:req.body.emailPhoneNumber}, (err,user)=>{
            if(err){    
                console.log(err)
                res.json({ 'success': false, 'message': 'Something went wrong, please try again later ', code: 500, info:{} })
            }else{
                if(user ==  null){
                    const user = userModel({
                        emailPhoneNumber: req.body.emailPhoneNumber,
                        password: req.body.password,
                        firstName: req.body.firstName,
                        lastName: req.body.lastName,
                        
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
    },

    changePassword : async function(req,res) {
        try{   
         userModel.findOne({emailPhoneNumber:req.body.emailPhoneNumber, password:req.body.password}, (err,user)=>{
            if(err){    
                console.log(err)
                res.json({ 'success': false, 'message': 'Something went wrong, please try again later ', code: 500, info:{} })
            }else{
                if(user ==  null){
                    
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

module.exports = UserController

const userModel = require('../models/user_model')
// const otpModel =  require('../models/otp_model')
// Bcrypt
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
                        otp:null
                        
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
        userModel.findOneAndUpdate({emailPhoneNumber:req.body.emailPhoneNumber},{$set: {password:req.body.newPassword}, }, {new:true},function(err,docs){
            if(err) res.json({'success': false, 'mesage': 'Failed To Change Password',  code:500, info:{}})
            else{
                docs = JSON.parse(JSON.stringify(docs))
                console.log(docs)
                res.json({'success': true, 'message':'Password changed successfullly', code:200, info:docs})
            }
        
        });
    }
        catch(e){
            console.log('error'+e)
            res.json({'success': false, 'message':e, code:500, info:{}})
          
        }
    },

    getOtp : async function(req,res) {
        try{   
            userModel.findOne({emailPhoneNumber:req.body.emailPhoneNumber}, (err,user) =>{
                if(err){
                    console.log(err)
                    res.json({ 'success': false, 'message': 'Something went wrong, please try again later ', code: 500, info:{} })
                }else{
                    if(user == null){
                        res.json({ 'success': false, 'message': 'Account Not Found, Please SignIn', code: 500, info:{} })
                        // console.log({ 'success': false, 'message': 'Account Not Found, Please SignIn', code: 500, info:{} })
                    }else{
                        let random = Math.floor(Math.random() * 900000) + 100000;
                        random = random.toString();
                        
                        userModel.findOneAndUpdate({emailPhoneNumber:req.body.emailPhoneNumber},{$set:{otp:random}},{new:true}, function(err, docs){
                            if(err) res.json({'success': false, 'mesage': 'Failed to send OTP', code:500, info:{}})
                            else{
                                docs = JSON.parse(JSON.stringify(docs))
                                console.log(docs)
                                res.json({'success': true, 'message':'OTP send successfully', code:200, info: {'otp':random}})
                            }
                        })

                    }  
                }
            })
        }catch(e){
            console.log('error'+e)
            res.json({'success': false, 'message' : e, code:500, info:{}})
          
        }
    },

    verifyOtp : async function(req,res) {
        try{   
            userModel.findOne({emailPhoneNumber:req.body.emailPhoneNumber}, (err,user) =>{
                if(err){
                    console.log(err)
                    res.json({ 'success': false, 'message': 'Something went wrong, please try again later ', code: 500, info:{} })
                }else{
                    if(user == null){
                        res.json({ 'success': false, 'message': 'Account Not Found, Please SignIn', code: 500, info:{} })
                        console.log({ 'success': false, 'message': 'Account Not Found, Please SignIn', code: 500, info:{} })
                    }else{
                        if(user.otp == req.body.otp){
                            res.json({ 'success': true, 'message': 'OTP verified successfully', code: 200, info:{} })   
                        }else{
                            res.json({ 'success': false, 'message': 'OTP verification failed', code: 500, info:{} })
                        }

                    }  
                }
            })
        }catch(e){
            console.log('error'+e)
            res.json({'success': false, 'message' : e, code:500, info:{}})
          
        }
    },
        
}


module.exports = UserController

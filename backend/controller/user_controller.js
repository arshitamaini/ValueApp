const userModel = require('../models/user_model')

var UserController = {

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

                    if(user.password == req.body.password) {
                        res.json({ 'success': true, 'message': 'Login Successful', code: 500, info : user  })
                    } else {
                        res.json({ 'success': false, 'message': 'Incorrect password or phone number ', code: 500, info:{} })
                    }


                    // decryptedPassword = cryptr.decrypt(user.password);
                    // decryptedPassword = cryptr.decrypt(user.password)
                    
                    // if(decryptedPassword == req.body.password){
                    //     console.log(user)
                        // res.json({ 'success': true, 'message': 'Login Successful', code: 500, info : user  })
                    // }else{
                    //     console.log('incorrectPasword' )
                    //     res.json({ 'success': false, 'message': 'Incorrect password or phone number ', code: 500, info:{} })
                    // }
                    // res.json({ 'success': false, 'message': 'Incorrect password or phone number ', code: 500, info:{} })
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
                    // encryptedPassword= cryptr.encrypt(req.body.password);
                    // const user = User({
                    // encryptedPassword= cryptr.encrypt(req.body.password);
                    const user = userModel({
                        phoneNumber: req.body.phoneNumber,
                        password: req.body.password,
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

module.exports = UserController

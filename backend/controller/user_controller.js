const userModel = require('../models/user_model')

var UserController = {

    login : async function(req,res) {
        
        await userModel.find({phoneNumber:req.body.phoneNumber}, (err,user)=>{
            if(err){
                console.log(err)
                res.json({ 'success': false, 'message': 'Something went wrong, please try again later ', code: 500, info:{} })
            }else{
                if(user == null){
                    console.log({ 'success': false, 'message': 'Account Not Found, Please SignIn', code: 500, info:{} })
                    res.json({ 'success': false, 'message': 'Account Not Found, Please SignIn', code: 500, info:{} })
                }else{
                    user = JSON.parse(JSON.stringify(user))
                    // decryptedPassword = cryptr.decrypt(user.password);
                    
                    // if(decryptedPassword == req.body.password){
                    //     console.log(user)
                    //     res.json({ 'success': true, 'message': 'Login Successful', code: 500, info : user  })
                    // }else{
                    //     console.log('incorrectPasword' )
                    //     res.json({ 'success': false, 'message': 'Incorrect password or phone number ', code: 500, info:{} })
                    // }
                    res.json({ 'success': false, 'message': 'Incorrect password or phone number ', code: 500, info:{} })
                }
               
    
               
            }
        })
    },

    signUp : async function(req,res) {
        try{       
         await userModel.find({phoneNumber:req.body.phoneNumber}, (err,user)=>{
            if(err){
                console.log(err)
                res.json({ 'success': false, 'message': 'Something went wrong, please try again later ', code: 500, info:{} })
            }else{
                if(user ==  null){
                    // encryptedPassword= cryptr.encrypt(req.body.password);
                    const user = User({
                        phoneNumber: req.body.phoneNumber,
                        password: req.body.password,
                        name: req.body.name,
                        email:req.body.email,
                    })
                    user.save(async function(err, userData) {
                        if(err){
                          res.json({'success':false, 'message': 'something went wrong', code : 500, info: {}});
                        }
                        console.log(dataInfo);
                        res.json({'success':true, 'message':'Account created successfully', code:200,  info:userData});
                    })
                }else{
                     res.json({'success': false,'message':'Account Already exists', code:500, info:{}})
                }
            }
        })}catch(e){
            res.json({'success': false,'message':e, code:500, info:{}})
            console.log('error'+e)
        }
    

    }

}

module.exports = UserController



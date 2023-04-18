const goodBehaviourTask = require('../models/good_behaviour_model')
var fs = require('fs');
var path = require('path');
var multer = require('multer');


//Setting storage engine
const storageEngine = multer.diskStorage({
    destination: "./images",
    filename: (req, file, cb) => {
    cb(null, `${Date.now()}--${file.originalname}`);
    },
})



const checkFileType = function (file, cb) {
        //Allowed file extensions
        const fileTypes = /jpeg|jpg|png|gif|svg/;
        
        //check extension names
        const extName = fileTypes.test(path.extname(file.originalname).toLowerCase());
        const mimeType = fileTypes.test(file.mimetype);
        
        if (mimeType && extName) {
        return cb(null, true);
        } else {
        cb("Error: You can Only Upload Images!!");
        }
    };

//initializing multer
const upload = multer({
    storage: storageEngine,
    fileFilter: (req, file, cb) =>{
        checkFileType(file, cb)
        },
    })
 


var GoodBehaviourController = {

    addNewTask: upload.single("image"), async function(req, res, next){

        try{
            var obj = {
            name: req.body.name,
            image: {
                data: fs.readFileSync(path.join(__dirname + '/uploads/' + req.file.filename)),
            }
        }
        goodBehaviourTask.create(obj).then((err, item) =>{
            if(err){
                res.json({ 'success': true, 'file successfully uploaded': e, code: 500, count:0, info:[item]})

            }else{
                console.log(ssuccessss);

            }
        })
    }catch(e){
        res.json({ 'success': false, 'message': 'Something went wrong, please try again later ', code: 500, count:0, info:[]})
        }


    },

    fetchTask : async function(req,res) { 
       try{
        goodBehaviourTask.find().exec(async function(err, dataInfo){
            if(err){
                res.json({ 'success': false, 'message': 'Something went wrong, please try again later ', count:0, code: 500, info:[]})
            }else{
            
                if(dataInfo.length > 0){
                    var newArr = []
                    for(let data of dataInfo){
                        data = JSON.parse(JSON.stringify(data))
                        newArr.push(data)
                    }
                    console.log(newArr)
                    res.json({ 'success': true, 'message': 'Task Found', code: 500, count:newArr.length, info:newArr })
    
                }else{
                    res.json({ 'success': false, 'message': 'No tasks found', code: 500, count:0, info:[] })
                }
            }
           })
       }catch(e){
        res.json({ 'success': false, 'message': 'Something went wrong, please try again later ', code: 500, count:0, info:[]})
       }
    },
   

   
}

module.exports = GoodBehaviourController

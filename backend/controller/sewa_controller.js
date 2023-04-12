const sewaTaskModel = require('../models/sewa_model')

var SewaController = {

    fetchTask : async function(req,res) { 
       try{
       
        sewaTaskModel.find(
            
            {$or : [
                {"userId":req.body.userId},
                {"userId":""}
        ]}
            ).exec(async function(err, dataInfo){
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
                    console.log({ 'success': true, 'message': 'Task Found', code: 500, count:newArr.length, info:newArr })
    
                }else{
                    res.json({ 'success': false, 'message': 'No tasks found', code: 500, count:0, info:[] })
                }
            }
           })
       }catch(e){
        res.json({ 'success': false, 'message': 'Something went wrong, please try again later ', code: 500, count:0, info:[]})
       }
    },

    addNewTask : async function(req,res) { 
        try{
        const newTask = sewaTaskModel({
            
                        taskTitle: req.body.taskTitle,
                        taskDescription: req.body.taskDescription,
                        userId: req.body.userId,
        })
        newTask.save(async function(err, newTaskData) {
            if(err){
            console.log(err) 
              res.json({'success':false, 'message': 'Something went wrong', code : 500, info: []});
            }
          else{
            res.json({'success':true, 'message':'Task Added successfully', code:200,  info:newTaskData});
          }
            
        })

        }catch(e){
         res.json({ 'success': false, 'message': 'Something went wrong, please try again later ', code: 500, count:0, info:[]})
        }
     },


   
}

module.exports = SewaController

const planetCareTask = require('../models/planet_care_model')

var PlanetCareController = {

    fetchTask : async function(req,res) { 
       try{
        planetCareTask.find().exec(async function(err, dataInfo){
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

module.exports = PlanetCareController

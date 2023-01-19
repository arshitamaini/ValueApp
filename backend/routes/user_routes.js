const express = require('express')
const app = express()
const port = 8080 || process.PORT
const cors = require('cors')
const bodyParser = require('body-parser')
const mongoose = require('mongoose')
const utf8Encoder = new TextEncoder();

mongoose.set("strictQuery", true);
mongoose.connect("mongodb://localhost:27017/valueAppdb")

app.use(cors())
app.use(bodyParser.urlencoded({extended:true}))
app.use(bodyParser.json())

app.use('/', require('./routes/user.route'))

app.listen(port, ()=>{
    console.log('port running on ' + port)
})


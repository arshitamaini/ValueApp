const express = require('express')
const app = express()
const port = 8080 || process.PORT
const cors = require('cors')
const bodyParser = require('body-parser')
const mongoose = require('mongoose')
const utf8Encoder = new TextEncoder();

require('dotenv').config();

mongoose.set("strictQuery", true);
mongoose.connect("mongodb://localhost:27017/valueAppdb")

app.use(cors())
app.use(bodyParser.urlencoded({extended:true}))
app.use(bodyParser.json())

app.use('/valueApp', require('./routes/controller_index'))
app.get('/', (req, res) => {
    res.json({"message": "Welcome to MyValues App."});
});

app.listen(port, ()=>{
    console.log('port running on ' + port)
})

module.exports = app;

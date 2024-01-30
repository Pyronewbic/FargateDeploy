const express = require('express'); 
const app = express();
const port = process.env.PORT || 80

app.get('/', function(req, res){
    res.send('Hello World');
});

app.listen(port,()=>{
    console.log(`Running on port ${port}`)
})
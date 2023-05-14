const express = require('express')
const app = express()
const port = 3000;
var cors = require('cors');
app.use(cors());

app.get('/user/:name', (req, res) => {
    const {name} = req.params;
    if(name=='jungha'){ 
        res.json({'age':26});
    }
    else if(name=='jung'){
        res.json({'age':27});
    }
    else{
        res.json({'age':'unknown'});
    }
});

app.listen(port);


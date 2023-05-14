/*console.log('hi');
console.log('whatsup');

var figlet = require("figlet");

figlet("oy whatssup", function (err, data) {
  if (err) {
    console.log("Something went wrong...");
    console.dir(err);
    return;
  }
  console.log(data);
});
*/
const express = require('express')
const app = express()
const port = 3000;

jsObj = {
    default: 'default',
    dog: 'bark',
    cat: 'meow',
    bird: 'chirp'
}
//get -> 주소창으로 요청을 보냄
app.get('/', function (req, res) {
  res.send(jsObj.default+'<a href="#">hi</a>');
})
app.get('/animals', function (req, res) {
  res.send(jsObj);
})
app.get('/json', function (req, res) {
  res.json({'name':'jungha'});
})
//콜론을 써주고, 변수명을 그 뒤에 써주면, 그 변수를 안에서 params 마냥 사용가능하다. params 방식
app.get('/user/:name', function (req, res) {
  //res.json({'name':'jungha', 'id':req.params.id});
}) 
//query 방식. google 마냥 jungha를 치면 q=jungha 로 쿼리로 보내는것. 주소창에서 물음표? 뒤에 쿼리를 써주면 된다.
app.get('/user/:id', function (req, res) {
  const q = req.query;
  console.log(q);
  res.json({'id':q.id});
})  
app.get('/user', function (req, res) {
  const q = req.query;
  console.log(q);
  res.json({'id':q.q,
  'age':q.age});
})  

app.listen(port, () =>{ console.log(`Example app listening on port ${port}!`)});


//post방식은 get과는 조금 다름. post는 req.params방식은 같으나 req.query방식은 다름.
//post는 주소창에 쿼리를 쓰지 않고, body에 쿼리를 쓴다. 그래서 주소창에는 아무것도 안써져있음.

//get으로 어떤 값을 넣든 통일하는 하나의 app.get

app.get('/user/:name', function (req, res) {
  const {name} = req.params;
  if(name==='jungha'){
    res.json({'age':26});
  }
  else if(name==='jung'){
    res.json({'age':27});
  }
  else{
    res.json({'age':'unknown'});
  }
})

//cors는 html에서 요청을 보낼때, 다른 서버에서 요청을 보내는것을 막는것. 안전상 쓰는것이다

var cors = require('cors');
app.use(cors());

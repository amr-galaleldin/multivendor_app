const express=require('express');
const bodyParser=require('body-parser')
const app=express();
const userRouter=require('./routes/router');
const { Error } = require('mongoose');


app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use('/auth',userRouter);
app.all('*',(req,res)=>{

    const err=new Error(`${req.path} not found`)
    res.status(404).json({msg:err.message,field:"url"})
});



app.listen(300,()=>{

console.log("server is running !!");
});
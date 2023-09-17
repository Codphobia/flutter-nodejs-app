import express from "express";
import bodyParser from "body-parser";
import mongoose from "mongoose";
import dotenv from "dotenv";
 import noteRoute from "./routers/note.js";
 import NM from "./model/note_model.js";

 const app= express();
  dotenv.config();
mongoose.connect(process.env.DATABASE_URL).then((result) => {
    
app.get('/list',  function(req,res){
    var response={message:"'app is live now...'"}
    res.send(response);
});
// app.get('/list/ ',async function(req,res){
//     var note= new NM({
//         id:"'0002",
//         userId:"jamalkhanii691",
//         title:"this is my title",
//         description:"this is my des"
//     });
//    await note.save();
//     const response={massage:"new data created"};
//     res.json(response);
// })
}).catch((err) => {
   console.log(err); 
});

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }))

// parse application/json
app.use(bodyParser.json())
app.use('/note',noteRoute);
app.listen(3000,()=>console.log('sever is running'))

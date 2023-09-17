import express from "express";
import bodyParser from "body-parser";
import mongoose from "mongoose";
import dotenv from "dotenv";
 import noteRoute from "./routers/note.js";
 import NM from "./model/note_model.js";

 const app= express();
  dotenv.config();
  // parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }))

// parse application/json
app.use(bodyParser.json())
app.use('/note',noteRoute);

mongoose.connect(process.env.DATABASE_URL).then((result) => {
    
  app.listen(3000,()=>console.log('sever is running'))
 
}).catch((err) => {
   console.log(err); 
});

app.get('/',  function(req,res){
  var response={message:"'app is live now...'"}
  res.send(response);
});



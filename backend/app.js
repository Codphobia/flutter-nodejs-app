import express from "express";
import bodyParser from "body-parser";
import mongoose from "mongoose";
import dotenv from "dotenv";
 import noteRoute from "./routers/note.js";
 import NM from "./model/note_model.js";

 const app= express();
  dotenv.config();
// mongoose.connect().then((result) => {
    
// app.get('/',  function(req,res){
//     var response={message:"'app is live now...'"}
//     res.send(response);
// });
 
// }).catch((err) => {
//    console.log(err); 
// });
const PORT = process.env.PORT || 3000
const connectDB = async () => {
  try {
    const conn = await mongoose.connect(process.env.DATABASE_URL);
    console.log(`MongoDB Connected: ${conn.connection.host}`);
    app.get('/',  function(req,res){
          var response={message:"'app is live now...'"}
          res.send(response);
      });
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
}

//Routes go here
app.all('*', (req,res) => {
    res.json({"every thing":"is awesome"})
})
app.use(bodyParser.urlencoded({ extended: true }))

// parse application/json
app.use(bodyParser.json())
app.use('/note',noteRoute);
//Connect to the database before listening
connectDB().then(() => {

    app.listen(PORT, () => {
        console.log("listening for requests");
    })
})
// parse application/x-www-form-urlencoded

 

 
 import mongoose from "mongoose";

 var  noteSchema=mongoose.Schema({
    id:{type:String,
        unique:true,
        required:true,
    },
    userId:{
        type:String,
        required:true,

    },
    title:{
        type:String,
        required:true
    },
    description: {
        type:String,

    },
    dateAdded:{
        type:Date,
 default : Date.now,   }
 });
 export default mongoose.model('Note',noteSchema);
 
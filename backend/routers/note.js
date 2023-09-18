import express from "express";
import noteRoute from "../model/note_model.js";
const route=express.Router();
  

route.get('/testing',(req,res)=>res.send('hello api is working'));

route.post('/add', async    (req,res)=>{

    let    myNote= new noteRoute({
        id:req.body.id,
        userId:req.body.userId,
        title:req.body.title,
        description:req.body.description,
        
     });
     await myNote.save();
     const response={message:"New Note Created!"};
     res.json(response);
        
})
route.post('/delete',async function (req,res){
  await noteRoute.deleteOne({id:req.body.id}); 
  const response={message:"one Note Deleted!"};
  res.json(response);

})
route.post('/update', async function(req,res){
    await noteRoute.deleteOne({id:req.body.id});
    let    myNote= new noteRoute({
        id:req.body.id,
        userId:req.body.userId,
        title:req.body.title,
        description:req.body.description,
        
     });
     await myNote.save();
     const response={message:"New Note Updated!"};
     res.json(response);
})
route.get('/list', async(req,res)=>{
    let note=await noteRoute.find( );
    res.json(note);
})
export default route;
const ComicsModels = require('../models/tb_comics');

const getAllComics = async (req,res)=>{

    try{
        const [data] = await ComicsModels.getAllComics();
        
        res.json({
            message: "Get All Comics Success",
            data: data
        });
    }catch (error){
        res.json({
            message: error
        });
    }
}

const postComic = (req,res)=>{
    res.json({
        message: "Post Comic Success",
        data: req.body
    });
}

const updateComics = (req,res)=>{
    const {idComics}  = req.params;
    console.log("id : "+ idComics);
    res.json({
        message : "Update Comic success"
    });
}

const deleteComics = (req,res)=>{
    const {idComics}  = req.params;
    console.log("comics delete, id : "+ idComics);
    res.json({
        message : "Delete Comic success"
    });
}

module.exports = {
    getAllComics,
    postComic,
    updateComics,
    deleteComics
}

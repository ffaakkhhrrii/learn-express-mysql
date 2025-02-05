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

const postComic = async (req,res)=>{
    const {body} = req;

    if(!body.name){
        res.status(400).json({
            message: "Harap mengisi data comic terlebih dahulu"
        });
    }else{ 
        try{
            const imagePath = req.file ? req.file.filename : null;
            body.image = imagePath;
            await ComicsModels.createNewComics(body);
            res.status(201).json({
                message: "Create Comic Success",
                data: body
            });
        }catch(error){
            res.json({
                message: error
            });
        }
    }
    
}

const updateComics = async (req,res)=>{
    const {idComics}  = req.params;
    const {body} = req;
    try{
        const imagePath = req.file ? req.file.filename : null;
        body.image = imagePath;
        await ComicsModels.updateComics(body,idComics);
        res.status(201).json({
            message: `Update Comic ${body.name} Success`,
        });
    }catch(error){
        res.json({
            message: error
        });
    }
}

const deleteComics = async (req,res)=>{
    const {idComics}  = req.params;
    try{
        await ComicsModels.deleteComic(idComics);
        res.json({
            message: `Delete Comic Success`,
        });
    }catch(error){
        res.json({
            message: error,
        });
    }
}

module.exports = {
    getAllComics,
    postComic,
    updateComics,
    deleteComics
}

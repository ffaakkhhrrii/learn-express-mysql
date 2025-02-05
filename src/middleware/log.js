const logRequest = (req,res,next)=>{
    console.log("Log request to path :",req.path);
    next();
}

module.exports = logRequest;
const dbPool = require('../config/database');

const getAllComics = () =>{
    const query = "SELECT * FROM tb_comics";
    return dbPool.execute(query);
}

module.exports = {
    getAllComics
}
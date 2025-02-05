const dbPool = require('../config/database');
const utils = require('../utils/format');

const getAllComics = () =>{
    const query = "SELECT * FROM tb_comics";
    return dbPool.execute(query);
}

const createNewComics = (body)=>{
    const query = `INSERT INTO tb_comics 
    (name, author,released_at,created_at,chapter,image) 
    values ('${body.name}','${body.author}','${body.released_at}','${utils.formatDate()}','${body.chapter}','${body.image}')`;
    return dbPool.execute(query);
}

const updateComics = (body,idComics)=>{
    const query = `UPDATE tb_comics SET
    name='${body.name}',
    author='${body.author}',
    released_at='${body.released_at}',
    chapter='${body.chapter}',
    on_going='${body.on_going}',
    image='${body.image}',
    updated_at='${utils.formatDateWithTime()}'
    WHERE id='${idComics}'`
    return dbPool.execute(query);
}

const deleteComic = (idComics)=>{
    const query = `DELETE FROM tb_comics WHERE id='${idComics}'`;
    return dbPool.execute(query);
}

module.exports = {
    getAllComics,
    createNewComics,
    updateComics,
    deleteComic
}
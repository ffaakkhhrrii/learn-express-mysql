const express = require('express');

const ComicsController = require('../controller/comics.js');
const router = express.Router();
const multer =require('../middleware/multer.js');

// read
router.get("/",ComicsController.getAllComics);

// create
router.post("/",multer.upload.single('image'),ComicsController.postComic);

// update
router.patch("/:idComics",multer.upload.single('image'),ComicsController.updateComics);

// delete
router.delete('/:idComics',ComicsController.deleteComics);

module.exports = router;
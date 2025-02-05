const express = require('express');

const ComicsController = require('../controller/comics.js');
const router = express.Router();

// read
router.get("/",ComicsController.getAllComics);

// create
router.post("/",ComicsController.postComic);

// update
router.patch("/:idComics",ComicsController.updateComics);

// delete
router.delete('/:idComics',ComicsController.deleteComics);

module.exports = router;
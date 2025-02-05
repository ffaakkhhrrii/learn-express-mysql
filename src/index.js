require('dotenv').config()
const PORT = process.env.PORT || 5000;

const express = require('express');

const app = express();

const middleware = require("./middleware/log.js");
const comicsRoutes = require('./routes/comics.js');

app.use(middleware);
app.use(express.json());
app.use(express.static('public/images'));

app.use("/comics",comicsRoutes);

app.listen(PORT, ()=>{
    console.log(`Server berhasil di running port ${PORT}`);
})
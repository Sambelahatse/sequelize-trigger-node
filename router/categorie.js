const express = require('express');
const {Categorie} = require('../models')
const router = express.Router();

router.get("/", (req, res) =>{
    res.json("Hello world")
});

router.post("/", async(req, res) =>{
    const categorie = req.body;
    // await Categorie.create(Categorie);
    // const jane = await Categorie.save({ nom: "Jane"});
    res.json(categorie);
});


module.exports = router;
const express = require('express');
const router = express.Router();

router.get("/", async(req, res) =>{
    const resp = await fetch('http://localhost:4000/api/livre')
    const livre = await resp.json()
    res.render('admin/livre', {
      livres: livre,
    })
});

module.exports = router;
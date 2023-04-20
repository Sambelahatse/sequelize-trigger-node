
const express = require('express')

const bodyparser = require('body-parser');
const {Menu} = require('./models');
const {Livre} = require("./models");

const app = express()

app.use('/adminlte', express.static(__dirname+'/assets/adminlte'))
app.use('/js', express.static(__dirname+'/assets/js'))
app.use('/css', express.static(__dirname+'/assets/css'))
app.set('view engine', 'ejs')

const jsonParser = bodyparser.json()


                /**LIVRE */
// CREATE
app.post('/api/livre', jsonParser, async (req,res) => {
    try {
      const dataLivre = await Livre.create({
        TitreLivre: req.body.TitreLivre,
        AuteurLivre: req.body.AuteurLivre,
        EditeurLivre: req.body.EditeurLivre,
        DateParutionLivre: req.body.DateParutionLivre
      })
      res.status(201).send(dataLivre)
    } catch (error) {
      res.status(422).send('UNABLE TO INSERT DATA')
    }
  })

//READ
  app.get('/api/livre', jsonParser, async(req, res) => {
    const dataLivre = await Livre.findAll()
    res.send(dataLivre)
  })

//READ ONE BY PK
app.get('/api/livre/:id', jsonParser, async(req, res) => {
    const dataLivre = await Livre.findByPk(req.params.id)
    res.send(dataLivre)
  })

// UPDATE
app.put('/api/livre/:id', jsonParser, async(req,res) => {
    try{
      const dataLivre = await Livre.findByPk(req.params.id)
      dataLivre.name = req.body.TitreLivre,
      dataLivre.AuteurLivre = req.body.AuteurLivre,
      dataLivre.EditeurLivre = req.body.EditeurLivre,
      dataLivre.DateParutionLivre = req.body.DateParutionLivre
      await dataLivre.save()
      res.status(202).send(dataLivre)
    }catch(error){
      res.status(422).send('UNABLE TO UPDATE DATA')
    }
  })


// DELETE
app.delete('/api/livre/:id', async (req, res) => {
    try{
      const dataLivre = await Livre.findByPk(req.params.id)
      dataLivre.destroy()
      res.status(202).send('DELETED')
    }catch(error){
      res.status(422).send('UNPROCESSABLE')
    }
  })



                      /** VIEWS */ 
//HOME
app.get('/', async(req, res) => {

  const resp = await fetch('http://localhost:4000/api/livre')
  const livre = await resp.json()
  // const resp2 = await fetch('http://localhost:4000/emprunteur')
  // const emprunteur = await resp2.json()
  // const resp3 = await fetch('http://localhost:4000/emprunt')
  // const emprunt = await resp3.json()
  // const resp4 = await fetch('http://localhost:4000/exemplaire')
  // const exemplaire = await resp4.json()
  res.render('admin/dashboard', {
    livres: livre
  })
})


app.get('/livre', async (req, res) => {
  const resp = await fetch('http://localhost:4000/api/livre')
  const data = await resp.json()
  res.render('dashboard', { 
    livres: data
  })
})



app.listen(4000, (req, res) => {
    console.log("APP IS RUNNING on localhost:4000")
})
const moment = require('moment')
const express = require('express')

const bodyparser = require('body-parser');
const {Livre, emprunteur, exemplaire, emprunt, livre_audit, emprunteur_audit, exemplaire_audit, emprunt_audit} = require("./models");

const app = express()

app.use('/adminlte', express.static(__dirname+'/assets/adminlte'))
app.use('/js', express.static(__dirname+'/assets/js'))
app.use('/css', express.static(__dirname+'/assets/css'))
app.set('view engine', 'ejs')

const jsonParser = bodyparser.json();


                /**LIVRE API */
// CREATE
app.post('/api/livre/add', jsonParser, async(req,res) => {
    try {
        const dataLivre = await Livre.create({
          TitreLivre: req.body.TitreLivre,
          AuteurLivre: req.body.AuteurLivre,
          EditeurLivre: req.body.EditeurLivre,
          DateParution: req.body.DateParution
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
app.delete('/api/livre/delete/:id', async (req, res) => {
    try{
      const dataLivre = await Livre.findByPk(req.params.id)
      dataLivre.destroy()
      res.status(202).send('DELETED')
    }catch(error){
      res.status(422).send('UNPROCESSABLE')
    }
})


                /**Emprunteur API */
// CREATE
app.post('/api/livre/add', jsonParser, async(req,res) => {
  try {
      const dataLivre = await Livre.create({
        TitreLivre: req.body.TitreLivre,
        AuteurLivre: req.body.AuteurLivre,
        EditeurLivre: req.body.EditeurLivre,
        DateParution: req.body.DateParution
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
app.delete('/api/livre/delete/:id', async (req, res) => {
  try{
    const dataLivre = await Livre.findByPk(req.params.id)
    dataLivre.destroy()
    res.status(202).send('DELETED')
  }catch(error){
    res.status(422).send('UNPROCESSABLE')
  }
})


                /**Exemplaire API */
// CREATE
app.post('/api/livre/add', jsonParser, async(req,res) => {
  try {
      const dataLivre = await Livre.create({
        TitreLivre: req.body.TitreLivre,
        AuteurLivre: req.body.AuteurLivre,
        EditeurLivre: req.body.EditeurLivre,
        DateParution: req.body.DateParution
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
app.delete('/api/livre/delete/:id', async (req, res) => {
  try{
    const dataLivre = await Livre.findByPk(req.params.id)
    dataLivre.destroy()
    res.status(202).send('DELETED')
  }catch(error){
    res.status(422).send('UNPROCESSABLE')
  }
})


                /**Emprunt API */
// CREATE
app.post('/api/livre/add', jsonParser, async(req,res) => {
  try {
      const dataLivre = await Livre.create({
        TitreLivre: req.body.TitreLivre,
        AuteurLivre: req.body.AuteurLivre,
        EditeurLivre: req.body.EditeurLivre,
        DateParution: req.body.DateParution
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
app.delete('/api/livre/delete/:id', async (req, res) => {
  try{
    const dataLivre = await Livre.findByPk(req.params.id)
    dataLivre.destroy()
    res.status(202).send('DELETED')
  }catch(error){
    res.status(422).send('UNPROCESSABLE')
  }
})

                /**Emprunt API */
// CREATE
app.post('/api/livre/add', jsonParser, async(req,res) => {
  try {
      const dataLivre = await Livre.create({
        TitreLivre: req.body.TitreLivre,
        AuteurLivre: req.body.AuteurLivre,
        EditeurLivre: req.body.EditeurLivre,
        DateParution: req.body.DateParution
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
app.delete('/api/livre/delete/:id', async (req, res) => {
  try{
    const dataLivre = await Livre.findByPk(req.params.id)
    dataLivre.destroy()
    res.status(202).send('DELETED')
  }catch(error){
    res.status(422).send('UNPROCESSABLE')
  }
})



// SUPERUSER

// Row
app.get('/api/exemplaire_count', jsonParser, async(req, res) => {
  const dataexemplaire = await exemplaire.count()
  res.json(dataexemplaire)
})

app.get('/api/emprunteur_count', jsonParser, async(req, res) => {
  const dataemprunteur = await emprunteur.count()
  res.json(dataemprunteur)
})

app.get('/api/livre_count', jsonParser, async(req, res) => {
  const dataLivre = await Livre.count()
  res.json(dataLivre)
})

app.get('/api/emprunt_count', jsonParser, async(req, res) => {
  const dataemprunt = await emprunt.count()
  res.json(dataemprunt)
})

// List
app.get('/api/livre_audit', jsonParser, async(req, res) => {
  const dataLivre = await livre_audit.findAll()
  res.json(dataLivre)
})

app.get('/api/exemplaire_audit', jsonParser, async(req, res) => {
  const dataexemplaire = await exemplaire_audit.findAll()
  res.json(dataexemplaire)
})

app.get('/api/emprunteur_audit', jsonParser, async(req, res) => {
  const dataemprunteur = await emprunteur_audit.findAll()
  res.json(dataemprunteur)
})

app.get('/api/emprunt_audit', jsonParser, async(req, res) => {
  const dataEmprunt = await emprunt_audit.findAll()
  res.json(dataEmprunt)
})


                      /*** VIEWS ***/ 

                      /** ADMIN */
//Home
app.get('/', async(req, res) => {

  const resp = await fetch('http://localhost:4000/api/livre')
  const livre = await resp.json()
  app.locals.moment = moment;
  res.render('admin/index', {
    livres: livre,

  })
})

//Livre
app.get('/livre', async(req, res) => {

  const resp = await fetch('http://localhost:4000/api/livre')
  const livre = await resp.json()
  app.locals.moment = moment
  res.render('admin/livre', {
    livres: livre,
  })
})

//Exemplaire
app.get('/exemplaire', async(req, res) => {

  const resp = await fetch('http://localhost:4000/api/livre')
  const livre = await resp.json()
  app.locals.moment = moment
  res.render('admin/livre', {
    livres: livre,
  })
})

// Emprunteur
app.get('/emprunteur', async (req, res) => {
  const resp = await fetch('http://localhost:4000/api/emprunteur')
  const data = await resp.json()
  res.render('admin/emprunteur', { 
    livres: data
  })
})

// Emprunt
app.get('/emprunt', async (req, res) => {
  const resp = await fetch('http://localhost:4000/api/emprunt')
  const data = await resp.json()
  res.render('admin/emprunt', { 
    livres: data
  })
})


/** VIEWS Superadmin */

app.get('/superadmin', async(req, res) => {

  const resp_livre = await fetch('http://localhost:4000/api/livre_audit')
  const livres = await resp_livre.json();
  const resp_exemp = await fetch('http://localhost:4000/api/exemplaire_audit')
  const exemplaires = await resp_exemp.json();
  const resp_emprunteur = await fetch('http://localhost:4000/api/emprunteur_audit')
  const emprunteurs = await resp_emprunteur.json();
  const resp_emprunt = await fetch('http://localhost:4000/api/emprunt_audit')
  const emprunts = await resp_emprunt.json();

  const count_livre = await fetch('http://localhost:4000/api/livre_count')
  const livre_count = await count_livre.json();
  const count_exemplaire = await fetch('http://localhost:4000/api/exemplaire_count')
  const exemplaire_count = await count_exemplaire.json();
  const count_emprunteur = await fetch('http://localhost:4000/api/emprunteur_count')
  const emprunteur_count = await count_emprunteur.json();
  const count_emprunt = await fetch('http://localhost:4000/api/emprunt_count')
  const emprunt_count = await count_emprunt.json();
  app.locals.moment = moment;
  res.render('superadmin/home', {
    livre_audits: livres,
    exemplaire_audits: exemplaires,
    emprunteur_audits: emprunteurs,
    emprunt_audits: emprunts,
    livre : livre_count,
    exemplaire: exemplaire_count,
    emprunteur: emprunteur_count,
    emprunt: emprunt_count

  })
})

app.get('/superadmin/livre', async(req, res) => {

  const resp = await fetch('http://localhost:4000/api/livre_audit')
  const livre = await resp.json()
  res.render('superadmin/livre', {
    livres: livre,
  })
})

app.get('/superadmin/exemplaire', async(req, res) => {

  const resp = await fetch('http://localhost:4000/api/exemplaire_audit')
  const livre = await resp.json()
  res.render('superadmin/exemplaire', {
    livres: livre,
  })
})

app.get('/superadmin/emprunteur', async(req, res) => {

  const resp = await fetch('http://localhost:4000/api/emprunteur_audit')
  const livre = await resp.json()
  res.render('superadmin/emprunteur', {
    livres: livre,
  })
})

app.get('/superadmin/emprunt', async(req, res) => {

  const resp = await fetch('http://localhost:4000/api/emprunt_audit')
  const livre = await resp.json()
  res.render('superadmin/emprunt', {
    livres: livre,
  })
})

app.listen(4000, (req, res) => {
    console.log("APP IS RUNNING on localhost:4000")
})
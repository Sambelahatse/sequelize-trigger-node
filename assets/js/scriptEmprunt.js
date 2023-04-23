const handleActionEdit = (elementId) => {
    const el = document.getElementById(elementId)
    const idExemplaire = document.getElementById("idExemplaire")
    const idEmprunteur = document.getElementById("idEmprunteur")
    const nombreEmprunt = document.getElementById("nombreEmprunt")
    const dateEmprunt = document.getElementById("dateEmprunt")
    const dateRetour = document.getElementById("dateRetour")

    if ($("#buttonEdit").hide()) {
      $("#buttonEdit").show();
      $("#buttonInsert").hide();
    }
    $("#modal_title").text("Modification de l'emprunt");

    idExemplaire.value = el.children[1].innerText
    idEmprunteur.value = el.children[2].innerText
    nombreEmprunt.value = el.children[3].innerText
    dateEmprunt.value = el.children[4].innerText
    dateRetour.value = el.children[5].innerText
  
    let ID = elementId.split('-')[2]
    document.getElementById("buttonEdit").onclick = () =>{handleSubmitEdit(ID)}
}

  const handleSubmitEdit = async (livreId) => {
    const idExemplaire = document.getElementById("idExemplaire")
    const idEmprunteur = document.getElementById("idEmprunteur")
    const nombreEmprunt = document.getElementById("nombreEmprunt")
    const dateEmprunt = document.getElementById("dateEmprunt")
    const dateRetour = document.getElementById("dateRetour")
  
    const resp = await fetch(`http://localhost:4000/api/emprunt/update/${livreId}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        idExemplaire: idExemplaire.value,
        idEmprunteur: idEmprunteur.value,
        nombreEmprunt: nombreEmprunt.value,
        dateEmprunt: dateEmprunt.value,
        dateRetour: dateRetour.value
      })
    })
    location.reload()
  }

  const addEmpruntfunction = () =>{
    $("#idExemplaire").prepend("<option selected>Choisir exemplaire</option>");
    $("#idEmprunteur").prepend("<option selected>Choisir l'emprunteur</option>");
    $("#nombreEmprunt").val("").attr("placeholder", "Entrer le nombre d'exemplaire à emprunté");
    $("#dateEmprunt").val("").attr("placeholder", "Entrer la da de parution du livre");
    $("#dateRetour").val("").attr("placeholder", "Entrer la da de parution du livre");

    if ($("#buttonInsert").hide()) {
      $("#buttonInsert").show();
      $("#buttonEdit").hide();
    }
    $("#modal_title").text("Ajout de Livre");
  }

  const handleInsertMenu = async () => {
    const idExemplaire = document.getElementById("idExemplaire")
    const idEmprunteur = document.getElementById("idEmprunteur")
    const nombreEmprunt = document.getElementById("nombreEmprunt")
    const dateEmprunt = document.getElementById("dateEmprunt")
    const dateRetour = document.getElementById("dateRetour")
  
    const resp = await fetch('http://localhost:4000/api/emprunt/add', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        idExemplaire: idExemplaire.value,
        idEmprunteur: idEmprunteur.value,
        nombreEmprunt: nombreEmprunt.value,
        dateEmprunt: dateEmprunt.value,
        dateRetour: dateRetour.value
      })
    })
  
    location.reload()
  }

  const handleActionDelete = (elementId) => {
    const el = document.getElementById(elementId)
    id.value = el.children[0].innerText

    let ID = elementId.split('-')[2]
    document.getElementById("buttonDelete").onclick = () =>{handleSubmitDelete(ID)}
  }
  
  const handleSubmitDelete = async (LivreId) => {
      await fetch(`http://localhost:4000/api/emprunt/delete/${LivreId}`, { method: 'DELETE',})
      location.reload()
  }
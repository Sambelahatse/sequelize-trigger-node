const handleActionEdit = (elementId) => {
    const el = document.getElementById(elementId)
    const nom = document.getElementById("nom")
    const prenom = document.getElementById("prenom")
    const adresse = document.getElementById("adresse")

    if ($("#buttonEdit").hide()) {
      $("#buttonEdit").show();
      $("#buttonInsert").hide();
    }
    $("#modal_title").text("Modification d'emprunteur");

    nom.value = el.children[1].innerText
    prenom.value = el.children[2].innerText
    adresse.value = el.children[3].innerText
  
    let ID = elementId.split('-')[2]
    document.getElementById("buttonEdit").onclick = () =>{handleSubmitEdit(ID)}
}

  const handleSubmitEdit = async (livreId) => {
    const nom = document.getElementById("nom")
    const prenom = document.getElementById("prenom")
    const adresse = document.getElementById("adresse")
  
    const resp = await fetch(`http://localhost:4000/api/emprunteur/update/${livreId}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        nom: nom.value,
        prenom: prenom.value,
        adresse: adresse.value,
      })
    })
    location.reload()
  }

  const addEmprunteurfunction = () =>{
    $("#nom").val("").attr("placeholder", "Entrer le nom");
    $("#prenom").val("").attr("placeholder", "Entrer le(s) prénom(s)");
    $("#adresse").val("").attr("placeholder", "Entrer l'adresse");

    if ($("#buttonInsert").hide()) {
      $("#buttonInsert").show();
      $("#buttonEdit").hide();
    }
    $("#modal_title").text("Ajout d'emprunteur");
  }

  const handleInsertMenu = async () => {
    const noms = document.getElementById("nom")
    const prenoms = document.getElementById("prenom")
    const adresses = document.getElementById("adresse")
  
    const resp = await fetch('http://localhost:4000/api/emprunteur/add', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        nom: noms.value,
        prenom: prenoms.value,
        adresse: adresses.value,
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
  
  const handleSubmitDelete = async (emprunteurId) => {
      await fetch(`http://localhost:4000/api/emprunteur/delete/${emprunteurId}`, { method: 'DELETE',})
      location.reload()
  }
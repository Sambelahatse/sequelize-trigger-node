const handleActionEdit = (elementId) => {
    const el = document.getElementById(elementId)
    const idLivre = document.getElementById("idLivre")
    const nombreExemplaire = document.getElementById("nombreExemplaire")

    if ($("#buttonEdit").hide()) {
      $("#buttonEdit").show();
      $("#buttonInsert").hide();
    }
    $("#modal_title").text("Modification de l'exemplaire");

    idLivre.value = el.children[1].innerText
    nombreExemplaire.value = el.children[2].innerText
  
    let ID = elementId.split('-')[2]
    document.getElementById("buttonEdit").onclick = () =>{handleSubmitEdit(ID)}
}

  const handleSubmitEdit = async (exemplaireId) => {
    const idLivre = document.getElementById("idLivre")
    const nombreExemplaire = document.getElementById("nombreExemplaire")
  
    const resp = await fetch(`http://localhost:4000/api/exemplaire/update/${exemplaireId}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        idLivre: idLivre.value,
        nombreExemplaire: nombreExemplaire.value,
      })
    })
    location.reload()
  }

  const addExemplairefunction = () =>{
    $("#idLivre").prepend("<option selected>Choisir le livre</option>");
    $("#nombreExemplaire").val("").attr("placeholder", "Entrer le nombre d'exemplaire");

    if ($("#buttonInsert").hide()) {
      $("#buttonInsert").show();
      $("#buttonEdit").hide();
    }
    $("#modal_title").text("Ajout d'exemplaire");
  }

  const handleInsertMenu = async () => {
    const idLivre = document.getElementById("idLivre")
    const nombreExemplaire = document.getElementById("nombreExemplaire")
  
    const resp = await fetch('http://localhost:4000/api/exemplaire/add', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        idLivre: idLivre.value,
        nombreExemplaire: nombreExemplaire.value,
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
  
  const handleSubmitDelete = async (exemplaireId) => {
      await fetch(`http://localhost:4000/api/exemplaire/delete/${exemplaireId}`, { method: 'DELETE',})
      location.reload()
  }
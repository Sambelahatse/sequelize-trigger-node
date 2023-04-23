const handleActionEdit = (elementId) => {
    const el = document.getElementById(elementId)
    const TitreLivre = document.getElementById("TitreLivre")
    const AuteurLivre = document.getElementById("AuteurLivre")
    const EditeurLivre = document.getElementById("EditeurLivre")

    if ($("#buttonEdit").hide()) {
      $("#buttonEdit").show();
      $("#buttonInsert").hide();
    }
    $("#modal_title").text("Modification de Livre");

    TitreLivre.value = el.children[1].innerText
    AuteurLivre.value = el.children[2].innerText
    EditeurLivre.value = el.children[3].innerText
    DateParution.value = el.children[4].innerText
  
    let ID = elementId.split('-')[2]
    document.getElementById("buttonEdit").onclick = () =>{handleSubmitEdit(ID)}
}

  const handleSubmitEdit = async (livreId) => {
    const TitreLivre = document.getElementById("TitreLivre")
    const AuteurLivre = document.getElementById("AuteurLivre")
    const EditeurLivre = document.getElementById("EditeurLivre")
    const DateParution = document.getElementById("DateParution")
  
    const resp = await fetch(`http://localhost:4000/api/livre/update/${livreId}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        TitreLivre: TitreLivre.value,
        AuteurLivre: AuteurLivre.value,
        EditeurLivre: EditeurLivre.value,
        DateParution: DateParution.value
      })
    })
    location.reload()
  }

  const addLivrefunction = () =>{
    $("#TitreLivre").val("").attr("placeholder", "Entrer titre");
    $("#AuteurLivre").val("").attr("placeholder", "Entrer l'auteur du livre");
    $("#EditeurLivre").val("").attr("placeholder", "Entrer l'éditeur du livre");
    $("#DateParution").val("").attr("placeholder", "Entrer la da de parution du livre");

    if ($("#buttonInsert").hide()) {
      $("#buttonInsert").show();
      $("#buttonEdit").hide();
    }
    $("#modal_title").text("Ajout de Livre");
  }

  const handleInsertMenu = async () => {
    const TitreLivre = document.getElementById("TitreLivre")
    const AuteurLivre = document.getElementById("AuteurLivre")
    const EditeurLivre = document.getElementById("EditeurLivre")
    const DateParution = document.getElementById("DateParution")
  
    const resp = await fetch('http://localhost:4000/api/livre/add', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        TitreLivre: TitreLivre.value,
        AuteurLivre: AuteurLivre.value,
        EditeurLivre: EditeurLivre.value,
        DateParution: DateParution.value
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
      await fetch(`http://localhost:4000/api/livre/delete/${LivreId}`, { method: 'DELETE',})
      location.reload()
  }
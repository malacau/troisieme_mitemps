const { Button } = require("bootstrap");
import { csrfToken } from "@rails/ujs";
import { data } from "jquery";

// Queryselectorall pour toutes les retrouver
// Itérer sur toutes les modales avec foreach
// Pour chacun des foreach ajouer l écouteur

const initSearchListener = (modale) => {
  const selectionForm = modale.querySelector('.searchplayerform');
  // console.dir(selectionForm);
  if (selectionForm) {
    // const searchform = modale.querySelector('#searchplayerform');
    const selectionId = selectionForm.dataset.selectionId
    modale.querySelector('form').addEventListener('submit', (event) => {
      const lastName = modale.querySelector(".select2-selection__rendered");
      console.dir(lastName)
      const team = modale.querySelector("#request_team");
      event.preventDefault()
      fetch("/players/search", {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken()
        },
        credentials: "same-origin",
        body: JSON.stringify({ request: { name: lastName.innerText, team: team.value, selection_id: selectionId }})
      })
      .then(response => response.json())
      .then((data) => {
        // console.log(data.players)
        const playersList = modale.querySelector(`#players-${selectionId}`)
        playersList.innerHTML = data.players;
      });

    })
  }
}

export { initSearchListener };

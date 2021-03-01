const { Button } = require("bootstrap");
import { csrfToken } from "@rails/ujs";
import { data } from "jquery";

const initSearchListener = () => {
  const selectionForm = document.querySelector('#searchplayerform');
  console.dir(selectionForm);
  if (selectionForm) {
    // const searchform = document.querySelector('#searchplayerform');
    const lastName = document.querySelector("#request_last_name");
    const team = document.querySelector("#request_team");
    document.querySelector('form').addEventListener('submit', (event) => {
      event.preventDefault()
      fetch("/players/search", {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken()
        },
        credentials: "same-origin",
        body: JSON.stringify({ request: { name: lastName.value, team: team.value }})
      })
        .then(response => response.json())
        .then((data) => {
          console.log(data.players)
          const selectionId = selectionForm.dataset.selectionId
          const playersList = document.getElementById(`players-${selectionId}`)
          console.log(playersList)
          playersList.innerHTML = data.players;
          // handle JSON response from server
          // const playersCard = document.querySelector(".card-player-grid")
          // playersCard.innerHTML = ""
          // data.players.forEach((player) => {
          //   playersCard.insertAdjacentHTML("beforeend", "<%= j 'selection_player_modale', player: player  %>");
          // })
        });

    })
  }
}
export { initSearchListener };
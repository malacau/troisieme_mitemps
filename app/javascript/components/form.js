const { Button } = require("bootstrap");

const initSearchListener = () => {
  if (document.querySelector('#searchplayerform')) {
    // const searchform = document.querySelector('#searchplayerform');
    const lastName = document.querySelector("#request_last_name");
    const team = document.querySelector("#request_team");
    document.querySelector('form').addEventListener('submit', (event) => {
      event.preventDefault()
      console.log(lastName.value)
      console.log(team.value)
    })
  }
}
export { initSearchListener };
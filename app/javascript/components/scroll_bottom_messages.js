const scrollBottomMessages = () => {
  const objDiv = document.getElementById("messages");
  
  if (objDiv) {
    objDiv.scrollTop = objDiv.scrollHeight;
  }
}
export { scrollBottomMessages }
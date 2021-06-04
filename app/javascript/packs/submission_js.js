function handleEnter(e) {
    document.querySelector("input[name='commit']").disabled = false;
    if(e.keyCode === 13){
      e.preventDefault();
    }
}

function handleEnterUp(e) {
  if(e.keyCode === 13){
    document.querySelector("#message_content").value = "";
  }
}

document.querySelector("#message_content").onkeydown = handleEnter;
document.querySelector("#message_content").onkeyup = handleEnterUp;
document.querySelector("input[name='commit']").onclick = () => {
  setTimeout(() => {document.querySelector("#message_content").value = ""}, 100);
}
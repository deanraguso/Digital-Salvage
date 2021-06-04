import consumer from "./consumer"

let url = window.location.href;

function createMessage(id, content){
  if (id == this_user_id){
    return  `<div class="container-fluid row p-1 justify-content-end float-right" style="max-width: 900px">
              <div class="container-fluid m-0 bg-primary text-white rounded">
                  <strong>${this_user_email}: </strong>
                  ${content}
                  <p style="display:inline-block; width:200px; text-align:end" class="float-right">just now
                </div>
            </div>`
  } else {
    return   `<div class="container-fluid row p-1 justify-content-start" style="max-width: 900px"s>
                <div class="container-fluid  m-0 bg-dark text-white rounded">
                    <strong>${other_user_email}: </strong>
                    ${content}
                    <p style="display:inline-block; width:200px; text-align:end" class="float-right">just now
                  </div>
              </div>`
  }

  
}

if(url.indexOf("inboxes/") !== -1){
  let inbox_id = parseInt(url.substring(url.search("inboxes/") + 8));

  consumer.subscriptions.create({"channel":"InboxChannel", "inbox_id":inbox_id}, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log(`connected to room ${inbox_id}`)
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data)
      document.querySelector("#messages").insertAdjacentHTML("afterbegin", createMessage(data.user_id, data.content))
    }
  });
  
}
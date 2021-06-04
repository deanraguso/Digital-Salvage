import consumer from "./consumer"

let url = window.location.href;

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
      console.log(data);
      document.querySelector("#messages").insertAdjacentHTML("beforeend", `<td>${data.text}</td>`)
    }
  });
}
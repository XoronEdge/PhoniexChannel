import socket from "./socket";

let Joinedchannel;
const joinButton = document.getElementById("join-channel-btn");
const channelInput = document.getElementById("channel-input-name");
const pushButton = document.getElementById("push-message-btn");
const messageInput = document.getElementById("message-input-field");
const nameButton = document.getElementById("name-btn");
const nameInput = document.getElementById("input-name");
let name;
nameButton.addEventListener("click", function (e) {
    name = nameInput.value;
})

joinButton.addEventListener("click", function (event) {
    let channelName = channelInput.value;
    Joinedchannel = socket.channel("video:" + channelName, { "name": name });
    Joinedchannel.on("ping",
        ({ count, topic }) => console.log(`PING from ${topic}::`, count))
    Joinedchannel.on("pong",
        ({ count, topic }) => console.log(`PONG from ${topic}::`, count))
    Joinedchannel.on("new_message", ({ user }) => console.log(`username ${user.username}:: message ${user.message}`))

    pushButton.addEventListener("click", function (event) {
        let message = messageInput.value;
        Joinedchannel.push("new_message", { message: message })
            .receive("error", (e) => {
                console.log(e)
            })
        messageInput.value = "";

    })

    Joinedchannel.join()
        .receive("ok", resp => { console.log("Joined successfully", resp) })
        .receive("error", resp => { console.log("Unable to join", resp) })
});

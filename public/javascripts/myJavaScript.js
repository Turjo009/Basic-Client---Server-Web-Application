function selectPhoto(radioId) {
    const radio = document.getElementById(radioId);
    radio.checked = true;
}

function sendMessage() {
    let messageData = {
        selectedItem: document.querySelector('input[name="photo"]:checked').value,
        message: document.getElementById('message-input').value
    };

    let myxhttp = new XMLHttpRequest();
    myxhttp.open('POST', '/message');
    myxhttp.setRequestHeader('content-type', 'application/json');
    myxhttp.send(JSON.stringify(messageData));

    document.getElementById('messageSent').innerText = "Message has been sent.";
}




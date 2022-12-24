const WebSocketServer = require('ws');

const wss = new WebSocketServer.Server({ port: 3000 })

wss.on("connection", ws => {
    console.log("Client connected to the server.");
        

    //Handle Data that Client Sent to the Server
    ws.on("message", data => {
        //console.log(`Client has sent us: ${data}`);

        var realData = JSON.parse(data);

        if (realData.eventName == "test_message")
        {
            console.log("Server received new message from client:");
            console.log(realData.msg);

            //Send a response to the client
            
            ws.send(
                JSON.stringify({
                    eventName : "pong",
                    msg : "Server received your message"
                })
            );
            
        }

    })
    // Handle disconnection
    ws.on("close", () => { 
        console.log("Client disconnected.");
    })

    // Handle client connection error
    ws.onerror = function () {
        console.log("Some Error occurred");
    }

});


console.log("The WebSocket server is running");
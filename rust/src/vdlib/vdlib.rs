use rust_socketio::{ClientBuilder, Payload, RawClient};
use serde_json::json;
use std::{fmt::format, time::Duration};

pub struct End4 {
    pub app_version: String,
    pub app_type: String,
    pub k_is_debug: bool,
}

impl End4 {
    pub fn new(self) -> Self {
        // get a socket that is connected to the admin namespace
        let mut socket = ClientBuilder::new(if self.k_is_debug {
            "http://localhost:3779/"
        } else {
            "https://api.vazir.io/"
        })
        .namespace(format!("/{}", self.app_type))
        .on("test", callback)
        .on("error", |err, _| eprintln!("Error: {:#?}", err))
        .connect()
        .expect("Connection failed");

        self
    }
}

// define a callback which is called when a payload is received
// this callback gets the payload as well as an instance of the
// socket to communicate with the server
fn callback(payload: Payload, socket: RawClient) {
    match payload {
        Payload::String(str) => println!("Received: {}", str),
        Payload::Binary(bin_data) => println!("Received bytes: {:#?}", bin_data),
    }
    socket
        .emit("test", json!({"got ack": true}))
        .expect("Server unreachable")
}

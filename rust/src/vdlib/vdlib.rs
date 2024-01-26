use rust_socketio::{client::Client, ClientBuilder, Payload, RawClient};
use serde_json::{self, json};
use std::{fmt::format, time::Duration};

pub struct End4 {
    pub socket: Client,
    pub socket_options: SocketOptions,
}

pub struct SocketOptions {
    pub app_version: String,
    pub app_type: String,
    pub k_is_debug: bool,
    pub on_connect: fn(Payload, RawClient),
    pub on_connecting: fn(Payload, RawClient),
    pub on_disconnect: fn(Payload, RawClient),
    pub on_error: fn(Payload, RawClient),
}

impl End4 {
    pub fn new(socket_options: SocketOptions) -> Self {
        // get a socket that is connected to the admin namespace
        let mut socket = ClientBuilder::new(if socket_options.k_is_debug {
            "http://localhost:3779/"
        } else {
            "https://api.vazir.io/"
        })
        .namespace(format!(
            "/{}.v{}",
            socket_options.app_type,
            socket_options.app_version.chars().next().unwrap()
        ))
        .on("connect", socket_options.on_connect)
        .on("disconnect", socket_options.on_disconnect)
        .on("error", socket_options.on_error)
        .on("connect_error", onConnectError)
        .auth(json!({}))
        .connect()
        .expect("Connection failed");

        End4 {
            socket,
            socket_options,
        }
    }

    pub fn dispose(&self) {
        self.socket.disconnect();
    }
}

// define a callback which is called when a payload is received
// this callback gets the payload as well as an instance of the
// socket to communicate with the server
// fn callback(payload: Payload, socket: RawClient) {
//     match payload {
//         Payload::String(str) => println!("Received: {}", str),
//         Payload::Binary(bin_data) => println!("Received bytes: {:#?}", bin_data),
//     }
//     socket
//         .emit("test", json!({"got ack": true}))
//         .expect("Server unreachable")
// }

fn onConnectError(payload: Payload, socket: RawClient) {}

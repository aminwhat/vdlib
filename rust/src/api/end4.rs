use serde_json::json;

use crate::vdlib::{End4, SocketOptions};

pub static END4: End4 = End4::new(SocketOptions {
    app_version: String::new(),
    app_type: String::new(),
    k_is_debug: true,
    on_connect: |_, _| {},
    on_connecting: |_, _| {},
    on_disconnect: |_, _| {},
    on_error: |_, _| {},
});

#[flutter_rust_bridge::frb(sync)]
pub fn end4_new(socket_options: SocketOptions) {
    END4 = End4::new(socket_options);
}

#[flutter_rust_bridge::frb(sync)]
pub fn end4_dispose() {
    End4::dispose(&END4);
}

use crate::vdlib::{End4, SocketOptions};

#[flutter_rust_bridge::frb(sync)]
pub fn end4_new(socket_options: SocketOptions) -> End4 {
    End4::new(socket_options)
}

#[flutter_rust_bridge::frb(sync)]
pub fn end4_dispose(end4: End4) {
    End4::dispose(&end4);
}

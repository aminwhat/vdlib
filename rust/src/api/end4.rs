use crate::end4::End4;

#[flutter_rust_bridge::frb(sync)]
pub fn new_end4(end4: End4) -> End4 {
    End4::new(end4)
}

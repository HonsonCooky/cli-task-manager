const std = @import("std");

/// Generate a time-based id. This is a single threaded solution, but for the purpose of creating and managing tasks in
/// our CLI, human operated application - this will suffice.
fn generateTaskId() u64 {
    return @bitCast(std.time.microTimestamp());
}

pub const Task = struct {
    id: u64,
    title: []u8,
    message: []u8,
};

test "Unique Task Ids" {
    const id1 = generateTaskId();
    const id2 = generateTaskId();
    try std.testing.expect(id1 != id2);
}

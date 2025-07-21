const std = @import("std");
const commands = @import("./commands.zig");

pub fn main() !void {
    const std_writer = std.io.getStdOut().writer();

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var arg_iter = try std.process.argsWithAllocator(allocator);
    defer arg_iter.deinit();
    _ = arg_iter.skip();

    _ = arg_iter.next() orelse {
        try std_writer.print("No commands provided. Use 'help' to list commands.", .{});
        return;
    };
}

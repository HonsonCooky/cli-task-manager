const std = @import("std");
const task = @import("./task.zig");

fn evaluateArgs(arg: []const u8, args: *std.process.ArgIterator) !void {
    std.debug.print("Evaluating {s}", .{arg});
    if (args.next()) |next| std.debug.print("Next: {s}", .{next});
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const allocator = gpa.allocator();
    var args = try std.process.argsWithAllocator(allocator);
    defer args.deinit();

    _ = args.skip(); // Ignore the file path.

    // while (args.next()) |arg| {
    //     try evaluateArgs(arg, &args);
    // }
}

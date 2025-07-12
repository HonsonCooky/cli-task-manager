const std = @import("std");

const Command = enum {
    hello,
};

fn handleCommand(arg: []const u8) void {
    if (std.meta.stringToEnum(Command, arg)) |cmd| {
        switch (cmd) {
            .hello => std.debug.print("hello world\n", .{}),
        }
    }
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const allocator = gpa.allocator();
    var args = try std.process.argsWithAllocator(allocator);
    defer args.deinit();

    // First argument is the file path
    _ = args.skip();
    // Parse other args
    while (args.next()) |arg| {
        handleCommand(arg);
    }
}

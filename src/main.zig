const std = @import("std");
const tasks = @import("./tasks.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var args = try std.process.argsWithAllocator(allocator);
    defer args.deinit();

    _ = args.skip();

    var task_manager = tasks.TaskManager.init(allocator);
    defer task_manager.deinit();
}

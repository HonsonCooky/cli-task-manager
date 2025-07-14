const std = @import("std");
const args_parser = @import("./args_parser.zig");
const tasks = @import("./tasks.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var arg_iter = try std.process.argsWithAllocator(allocator);
    defer arg_iter.deinit();
    _ = arg_iter.skip();

    var task_manager = tasks.TaskManager.init(allocator);
    defer task_manager.deinit();

    _ = try args_parser.parse_args(allocator, &arg_iter);
}

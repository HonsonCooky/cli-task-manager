const std = @import("std");

const CommandType = enum {
    create,
    read,
    update,
    delete,
    help,
};

const CommandOptions = std.StringHashMap([]const u8);

const CliCommand = struct {
    type: CommandType,
    options: CommandOptions,
};

const ParseError = error{
    MissingArgument,
    InvalidArgument,
};

fn parse_create(_: std.mem.Allocator, _: *std.process.ArgIterator) !CliCommand {}

pub fn parse_args(allocator: std.mem.Allocator, arg_iter: *std.process.ArgIterator) !CliCommand {
    if (arg_iter.next()) |arg| {
        if (std.mem.eql(u8, "create", arg)) {
            std.debug.print("Create Task", .{});
            return parse_create(allocator, arg_iter);
        } else if (std.mem.eql(u8, "read", arg)) {
            std.debug.print("Read Task", .{});
        } else if (std.mem.eql(u8, "update", arg)) {
            std.debug.print("Update Task", .{});
        } else if (std.mem.eql(u8, "delete", arg)) {
            std.debug.print("Delete Task", .{});
        } else if (std.mem.eql(u8, "help", arg)) {
            std.debug.print("Help Command", .{});
        } else {
            std.debug.print("Unknown command: {s}", .{arg});
        }
    } else {
        std.debug.print("No command provided.", .{});
        return ParseError.MissingArgument;
    }
    return;
}

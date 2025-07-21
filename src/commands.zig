const std = @import("std");

const CreateCommand = struct {};

pub const Command = union(enum) {
    create_command: CreateCommand,
    none,
};

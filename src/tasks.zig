const std = @import("std");

pub const Task = struct {
    id: u64,
    title: [128]u8,
    message: [65_536]u8,
    is_done: bool,
};

const TaskHashMap = std.AutoHashMap(u64, Task);

pub const TaskManager = struct {
    task_list: TaskHashMap,

    pub fn init(allocator: std.mem.Allocator) TaskManager {
        return TaskManager{
            .task_list = TaskHashMap.init(allocator),
        };
    }

    pub fn deinit(self: *TaskManager) void {
        self.task_list.deinit();
    }

    pub fn add_task(self: *TaskManager, task: Task) !bool {
        try self.task_list.put(task.id, task);
    }
};

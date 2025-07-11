const std = @import("std");

pub fn build(b: *std.Build) void {
    // BUILD
    // -----------------------------------------------------------------------------------------------------------------
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // We create a module here, to then build the test step later on.
    const exe_mod = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "tm",
        .root_module = exe_mod,
    });

    b.installArtifact(exe);

    // RUN COMMAND
    // -----------------------------------------------------------------------------------------------------------------
    const run_exe = b.addRunArtifact(exe);
    const run_step = b.step("run", "Run the application");
    run_step.dependOn(&run_exe.step);

    // TEST COMMAND
    // -----------------------------------------------------------------------------------------------------------------
    const test_exe = b.addTest(.{ .root_module = exe_mod });
    const test_exe_artifact = b.addRunArtifact(test_exe);
    const test_step = b.step("test", "Run unit tests on exe");
    test_step.dependOn(&test_exe_artifact.step);
}

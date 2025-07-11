# CLI Task Manager

An exercise to learn Zig. This is a command line task manager.

## Description

Build a simple CLI application that allows users to create, list, complete, and delete tasks. Tasks can
have a description and a status (e.g., pending or completed). Optionally, you can store tasks in a file (e.g., JSON or
plain text) to persist them between sessions.

## Why this project?

- **Core Concepts**: You'll practice Zig's syntax, memory management (allocators), string handling, and file I/O.
- **Scalability**: Start simple and add features like task priorities or due dates as you get comfortable.
- **Real-World Utility**: It's a tool you can actually use, making the project motivating.
- **Zig Strengths**: Zig's focus on explicit memory management and error handling will shine in parsing input and managing task data.

## Basic Features

- Add a task: Prompt the user for a task description and store it.
- List tasks: Display all tasks with their status.
- Complete a task: Mark a task as completed by index or ID.
- Delete a task: Remove a task from the list.
- Persist tasks:
- Save tasks to a file and load them on startup.

## Stretch Goals (to extend learning):

- Add task priorities or categories.
- Implement task filtering (e.g., show only pending tasks).
- Support task deadlines
- with date parsing.
- Add colorized output using ANSI escape codes.

import 'dart:io';

void main() {
  List<String> tasks = [];
  bool running = true;

  while (running) {
    print('To-Do List:');
    print('1. View All Tasks');
    print('2. Add New Task');
    print('3. Delete Task');
    print('4. Update Task');
    print('5. Exit');
    stdout.write('Enter your choice (1-5): ');
    
    String choice = stdin.readLineSync()!;
    
    switch (choice) {
      case '1':
        viewTasks(tasks);
        break;
      case '2':
        addTask(tasks);
        break;
      case '3':
        deleteTask(tasks);
        break;
      case '4':
        updateTask(tasks);
        break;
      case '5':
        running = false;
        print('Exiting...');
        break;
      default:
        print('Invalid choice. Please enter a number between 1 and 5.');
    }
  }
}

void viewTasks(List<String> tasks) {
  if (tasks.isEmpty) {
    print('No tasks available.');
  } else {
    print('Current Tasks:');
    for (int i = 0; i < tasks.length; i++) {
      print('${i + 1}. ${tasks[i]}');
    }
  }
}

void addTask(List<String> tasks) {
  stdout.write('Enter the task you want to add: ');
  String newTask = stdin.readLineSync()!;
  tasks.add(newTask);
  print('Task added: "$newTask"');
}

void deleteTask(List<String> tasks) {
  if (tasks.isEmpty) {
    print('No tasks to delete.');
    return;
  }
  
  viewTasks(tasks);
  stdout.write('Enter the task number you want to delete: ');
  String? input = stdin.readLineSync();
  
  if (input != null && int.tryParse(input) != null) {
    int taskIndex = int.parse(input) - 1;
    if (taskIndex >= 0 && taskIndex < tasks.length) {
      print('Task deleted: "${tasks[taskIndex]}"');
      tasks.removeAt(taskIndex);
    } else {
      print('Invalid task number.');
    }
  } else {
    print('Invalid input.');
  }
}

void updateTask(List<String> tasks) {
  if (tasks.isEmpty) {
    print('No tasks to update.');
    return;
  }
  
  viewTasks(tasks);
  stdout.write('Enter the task number you want to update: ');
  String? input = stdin.readLineSync();
  
  if (input != null && int.tryParse(input) != null) {
    int taskIndex = int.parse(input) - 1;
    if (taskIndex >= 0 && taskIndex < tasks.length) {
      stdout.write('Enter the new task: ');
      String newTask = stdin.readLineSync()!;
      tasks[taskIndex] = newTask;
      print('Task updated: "$newTask"');
    } else {
      print('Invalid task number.');
    }
  } else {
    print('Invalid input.');
  }
}


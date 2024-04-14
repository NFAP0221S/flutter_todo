// lib/models/main_controller.dart
import 'package:flutter/material.dart';
import 'todo_item.dart'; // 이전에 만든 TodoItem 클래스를 import

class Progress {
  String title;
  List<TodoItem> completedItems;
  List<TodoItem> ongoingItems; // 할 일 목록도 포함합니다.
  Progress({required this.title, this.completedItems = const [], this.ongoingItems = const []});
}

class MainController with ChangeNotifier {
  List<TodoItem> _todos = [];
  List<TodoItem> _completed = [];
  List<Progress> _progressList = [];

  List<TodoItem> get todos => _todos;
  List<TodoItem> get completed => _completed;
  List<Progress> get progressList => _progressList;

  void addTodo(String task) {
    _todos.add(TodoItem(content: task));
    notifyListeners();
  }

  void editTodo(int index, String newTask) {
    if (newTask.isNotEmpty) {
      _todos[index].content = newTask;
      notifyListeners();
    }
  }

  void toggleCompletion(int index) {
    _completed.add(_todos[index]);
    _todos.removeAt(index);
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  void removeCompleted(int index) {
    _completed.removeAt(index);
    notifyListeners();
  }

  void addProgress(String title) {
    // 진척도에 완료된 목록과 할 일 목록을 추가
    _progressList.add(Progress(title: title, completedItems: List.from(_completed), ongoingItems: List.from(_todos)));
    // 진척도 추가 후 기존 목록 비우기
    _completed.clear();
    _todos.clear(); // 할 일 목록도 비우기 필요에 따라 조정
    notifyListeners();
  }
}

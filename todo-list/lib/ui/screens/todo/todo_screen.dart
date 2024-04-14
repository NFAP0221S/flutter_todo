// lib/screens/todo_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/main_controller.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _textController = TextEditingController();

  void _showEditDialog(int index, MainController mainController) {
    TextEditingController _editController = TextEditingController(text: mainController.todos[index].content);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('할 일 수정'),
          content: TextField(
            controller: _editController,
            autofocus: true,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                if (_editController.text.isNotEmpty) {
                  mainController.editTodo(index, _editController.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('저장'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var mainController = Provider.of<MainController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("할 일 목록"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: '할 일 추가',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      mainController.addTodo(_textController.text);
                      _textController.clear();
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mainController.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    mainController.todos[index].content,
                    style: TextStyle(
                      color: mainController.todos[index].isCompleted ? Colors.grey : null,
                      decoration: mainController.todos[index].isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _showEditDialog(index, mainController),
                      ),
                      IconButton(
                        icon: const Icon(Icons.done),
                        onPressed: () {
                          mainController.toggleCompletion(index);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          mainController.removeTodo(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

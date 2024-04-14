// lib/screens/done_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/main_controller.dart';
import 'package:provider/provider.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mainController = Provider.of<MainController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("완료된 일 목록"),
      ),
      body: ListView.builder(
        itemCount: mainController.completed.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(mainController.completed[index].content),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => mainController.removeCompleted(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? title = await showDialog<String>(
            context: context,
            builder: (BuildContext context) {
              TextEditingController titleController = TextEditingController();
              return AlertDialog(
                title: Text('할 일을 끝내셨나요?'),
                content: TextField(
                  controller: titleController,
                  decoration: InputDecoration(hintText: "제목을 입력하세요."),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('취소'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (titleController.text.isNotEmpty) {
                        Navigator.of(context).pop(titleController.text);
                      } else {
                        Navigator.of(context).pop(); // 비어있을 때도 닫기
                      }
                    },
                    child: Text('확인'),
                  ),
                ],
              );
            },
          );

          if (title != null && title.isNotEmpty) {
            mainController.addProgress(title); // 진척도 목록에 추가
          }
        },
        child: Icon(Icons.check),
        tooltip: '오늘의 완료된 일 제목 입력',
      ),
    );
  }
}

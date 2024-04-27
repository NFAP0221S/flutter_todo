// ProgressScreen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/main_controller.dart';
import 'package:intl/intl.dart'; // 날짜 포맷을 위한 패키지
import 'package:provider/provider.dart';

class ProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mainController = Provider.of<MainController>(context);
    String formattedDate = DateFormat('yyyy/MM/dd').format(DateTime.now()); // 현재 날짜 포맷

    return Scaffold(
      appBar: AppBar(
        title: Text("종료된 일 목록"),
      ),
      body: ListView.builder(
        itemCount: mainController.progressList.length,
        itemBuilder: (context, index) {
          var progress = mainController.progressList[index];
          int totalItems = progress.completedItems.length + progress.ongoingItems.length;
          int completedItems = progress.completedItems.length;
          return ExpansionTile(
            title: Text("${progress.title} - $formattedDate ($totalItems개의 할 일중 / $completedItems개 완료)"),
            children: <Widget>[
              ...progress.completedItems.map((item) => ListTile(
                title: Text(item.content, style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough)),
              )).toList(),
              ...progress.ongoingItems.map((item) => ListTile(
                title: Text(item.content),
              )).toList(),
            ],
          );
        },
      ),
    );
  }
}

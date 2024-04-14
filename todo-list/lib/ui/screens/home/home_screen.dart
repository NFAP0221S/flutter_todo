import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/done/done_screen.dart';
import 'package:flutter_application_1/ui/screens/progress/progress_screen.dart';
import 'package:flutter_application_1/ui/screens/todo/todo_screen.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  // _HomeScreenState createState() => _HomeScreenState();
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // 3개의 탭을 위한 탭 컨트롤러
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
         bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), // 조정 가능한 높이
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey, width: 1.0),
                bottom: BorderSide(color: Colors.grey, width: 1.0),
              )
            ),
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: '할 일'),
                Tab(text: '완료된 일'),
                Tab(text: '지난 일'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TodoScreen(),
          DoneScreen(),
          ProgressScreen(),
        ],
      ),

    );
  }
}
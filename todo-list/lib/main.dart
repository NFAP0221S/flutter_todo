import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/main_controller.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/ui/screens/home/home_screen.dart';
// import 'firebase_options.dart';
// import 'app/app.dart';

// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainController(),
      child: const MaterialApp(
        title: 'Todo List App',
        home: HomeScreen(title: 'Todo',),
      ),
    );
  }
}
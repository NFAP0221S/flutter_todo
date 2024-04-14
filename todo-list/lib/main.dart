import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/ui/screens/home/HomeScreen.dart';
import 'firebase_options.dart';
import 'app/app.dart';

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
    
    return MaterialApp(
      title: 'Todo-list with flutter',
            theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(87, 105, 96, 1)),
        useMaterial3: true,
      ),
      home: const HomeScreen(title: 'Todo'),
    );
  }
}

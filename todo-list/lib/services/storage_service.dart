// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/task.dart';

// class StorageService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   Future<void> addTask(Task task) async {
//     await _db.collection('tasks').doc(task.id).set(task.toFirestore());
//   }

//   Stream<List<Task>> getTasks() {
//     return _db.collection('tasks').snapshots().map((snapshot) => snapshot.docs
//         .map((doc) => Task.fromFirestore(doc.data() as Map<String, dynamic>))
//         .toList());
//   }
// }
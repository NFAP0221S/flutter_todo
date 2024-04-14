class Task {
  final String id;
  final String title;
  final bool isDone;

  Task({required this.id, required this.title, this.isDone = false});

  // Firebase 문서로부터 Task 객체 생성
  factory Task.fromFirestore(Map<String, dynamic> doc) {
    return Task(
      id: doc['id'] as String,
      title: doc['title'] as String,
      isDone: doc['isDone'] as bool,
    );
  }

  // Task 객체를 Map으로 변환
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
    };
  }
}
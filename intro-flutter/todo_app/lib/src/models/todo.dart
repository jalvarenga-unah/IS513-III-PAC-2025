class Todo {
  final String id;
  final String title;
  final String? description;
  final bool completed;

  Todo({
    required this.title,
    this.description,
    required this.completed,
    required this.id,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    completed: json['completed'],
  );

  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description, 'completed': completed};
  }
}

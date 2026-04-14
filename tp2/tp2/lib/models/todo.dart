class Todo {
  final int _id;
  final String _title;
  final bool _completed;

  Todo(this._id, this._title, this._completed);

  // Getters
  bool get completed => _completed;
  String get title => _title;
  int get id => _id;

  factory Todo.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id': int id,
      'title': String title,
      'completed': bool completed
      } => Todo(id, title, completed), // Utilisation positionnelle ici

      _ => throw const FormatException('Erreur de parsing JSON sur un Todo'),
    };
  }
}
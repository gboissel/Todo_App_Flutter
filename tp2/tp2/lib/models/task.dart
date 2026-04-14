class Task {
  int id;
  String title;
  List<String> tags;
  int nbhours;
  int difficulty;
  String description;
  final bool completed = false;

  static int nb=0;

  Task({
    required this.id,
    required this.title,
    required this.tags,
    required this.nbhours,
    required this.difficulty,
    required this.description,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'tags': tags.join(','),
      'nbhours': nbhours,
      'difficulty': difficulty,
      'description': description,
      'completed': completed ? 1 : 0,
    };
  }
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      tags: (map['tags'] as String).isNotEmpty
          ? (map['tags'] as String).split(',')
          : [],
      nbhours: map['nbhours'],
      difficulty: map['difficulty'],
      description: map['description'],
    );
  }
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      tags: List<String>.from(json['tags']),
      nbhours: json['nbhours'],
      difficulty: json['difficulty'],
      description: json['description'],
    );
  }

  static List<Task> generateTask(int i) {
    List<Task> tasks = [];
    for (int n = 0; n < i; n++) {
      tasks.add(
        Task(
          id: n,
          title: "title $n",
          tags: ['tag $n', 'tag ${n + 1}'],
          nbhours: n,
          difficulty: n,
          description: 'description $n',
        ),
      );
    }
    return tasks;
  }

  factory Task.newTask(){
    nb++; //attribut static de la classe.
    return Task(id: nb, title: 'title $nb', tags: ['tags $nb'], nbhours:
    nb, difficulty: nb%5, description: 'description $nb');
  }
  factory Task.addTask(String title,String description,int difficulty){
    nb++;
    return Task(id: nb, title: title, tags: ['tags $nb'],difficulty: difficulty,
        nbhours: nb, description: description);
  }
}
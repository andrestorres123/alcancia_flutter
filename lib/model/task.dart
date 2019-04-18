class Task {
  final String title;
  final String checkedBy;
  bool isChecked;

  Task(this.title, this.checkedBy, this.isChecked);

  static List<Task> getTasks() {
    return List<Task>.generate(3, (index) => Task('Task $index', '', false));
  }

  static Task fromJson(Map<String, dynamic> json) {
    return Task(json["title"], json["checkedBy"], json["isChecked"]);
  }
}

class Story {
  final String by;
  final int descendants;
  final int id;
  final List<dynamic> kids;
  final int score;
  final int time;
  final String title;
  final String type;
  final String url;

  Story(this.by, this.descendants, this.id, this.kids, this.score, this.time,
      this.title, this.type, this.url);

  static Story fromJson(Map<String, dynamic> json) {
    return Story(json['by'], json['descendants'], json['id'], json['kids'],
        json['score'], json['time'], json['title'], json['type'], json['url']);
  }
}

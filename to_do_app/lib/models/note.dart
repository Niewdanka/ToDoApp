class Note {
  final String id;
  final String date;
  final String name;
  final String description;
  final int icon;
  final String categoryName;
  int categoryColor;
  int isCompleted;
  final String time;
  int width;

  Note({
    required this.id,
    required this.date,
    required this.name,
    required this.description,
    required this.icon,
    required this.categoryName,
    required this.categoryColor,
    required this.isCompleted,
    required this.time,
    required this.width,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'name': name,
      'description': description,
      'icon': icon,
      'categoryName': categoryName,
      'categoryColor': categoryColor,
      'isCompleted': isCompleted,
      'time': time,
      'width': width,
    };
  }
}

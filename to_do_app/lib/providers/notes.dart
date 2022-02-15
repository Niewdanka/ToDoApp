import 'package:flutter/cupertino.dart';
import 'package:to_do_app/helpers/db_helper.dart';
import 'package:to_do_app/models/note.dart';


class Notes with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes {
    return [..._notes];
  }

  Future<void> addNote(Note note) async {
    final newNote = Note(
      id: note.id,
      date: note.date,
      name: note.name,
      description: note.description,
      icon: note.icon,
      categoryName: note.categoryName,
      categoryColor: note.categoryColor,
      isCompleted: note.isCompleted,
      time: note.time,
      width: note.width,
    );
    _notes.add(newNote);
    notifyListeners();
    await DBHelper.insert(
      {
        'id': newNote.id,
        'date': newNote.date,
        'name': newNote.name,
        'description': newNote.description,
        'icon': newNote.icon,
        'categoryName': newNote.categoryName,
        'categoryColor': newNote.categoryColor,
        'isCompleted': newNote.isCompleted,
        'time': newNote.time,
        'width': newNote.width,
      },
    );
  }

  Future<void> fetchNotes() async {
    final data = await DBHelper.getData();
    _notes = data
        .map(
          (note) => Note(
            id: note['id'],
            date: note['date'],
            name: note['name'],
            description: note['description'],
            icon: note['icon'],
            isCompleted: note['isCompleted'],
            categoryName: note['categoryName'],
            categoryColor: note['categoryColor'],
            time: note['time'],
            width: note['width'],
          ),
        )
        .toList();
    notifyListeners();
  }

  Future<void> deleteNote(String id) async {
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
    await DBHelper.delete(id);
  }

  Note findById(String id) {
    return _notes.firstWhere((note) => note.id == id);
  }
}

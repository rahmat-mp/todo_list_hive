import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list_hive/model/note.dart';

class Boxes {
  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<Note>(NoteAdapter());

    await Hive.openBox<Note>(Note.boxKey);
  }

  static Box<Note> getNotes() => Hive.box<Note>(Note.boxKey);

  Future<bool> hasData() async {
    final noteBox = Hive.box<Note>(Note.boxKey);
    return noteBox.length > 0;
  }
}

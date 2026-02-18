import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NotesDatabase extends ChangeNotifier {
  static late Isar isar;
  //INITIALIZE-DATABASE
  static Future<void> initializa() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  //LIST NOTES
  final List<Note> currentNotes = [];

  //CREATE
  Future<void> addNote(String textFromUser) async {
    //create a note object
    final newNote = Note()..text = textFromUser;

    //save to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    //re-read from db
    await readNotes();
  }

  //READ
  Future<void> readNotes() async {
    List<Note> notesFromDB = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(notesFromDB);
    notifyListeners();
  }

  //UPDATE
  Future<void> updateNote(int id, String newText) async {
    //find the note by id
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      //update the text
      existingNote.text = newText;

      //save the updated note back to the database
      await isar.writeTxn(() => isar.notes.put(existingNote));

      //re-read from db
      await readNotes();
    }
  }

  //DELETE
  Future<void> deleteNote(int id) async {
    //delete from db
    await isar.writeTxn(() => isar.notes.delete(id));
    //re-read from db
    await readNotes();
  }
}

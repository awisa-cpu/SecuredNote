import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:samsung_note/utilities/Exceptions/note_service_exceptions.dart';
import 'package:samsung_note/models/note.dart';
import 'package:samsung_note/models/user.dart';
import 'package:sqflite/sqflite.dart';

import '../utilities/constants/note_service_constants.dart';

class NoteService {
  List<DbNote> _notes = [];
  Database? _db;

  NoteService._ins() {
    notesController = StreamController.broadcast(
      onListen: () => notesController.sink.add(_notes),
    );
  }
  static final NoteService _instance = NoteService._ins();
  factory NoteService() => _instance;

  //
  late final StreamController<List<DbNote>> notesController;

  void cacheNotes() async {
    final notes = await getAllNotes();
    _notes = notes;
    notesController.add(_notes);
  }

  void openDb() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = join(directory.path, dbName);
      final db = await openDatabase(path);

      _db = db;

      //incase the note table doesnt exist accidentally
      db.execute(createNoteTable);
      //incase the user table doesnt exist accidentally
      db.execute(createUserTable);
    } on MissingPlatformDirectoryException {
      throw NoteServiceException();
    }
  }

  void closeDb() {
    final db = _db;
    if (db == null) {
      throw DatabaseAlreadyClosed();
    } else {
      db.close();
      _db == null;
    }
  }

  Database _getDbOrThrowException() {
    final db = _db;
    if (db == null) {
      throw DatabaseNotExist();
    }

    return db;
  }

  void _ensureDbIsOpen() {
    try {
      openDb();
    } catch (error) {
      throw DatabaseCouldNotOpen();
    }
  }

//create a user
  Future<DbUser> createUser({required String email}) async {
    final db = _getDbOrThrowException();

    final result = await db.query(
      userTable,
      where: 'email = ?',
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      throw UserAlreadyExist();
    }

    final userId = await db.insert(
      userTable,
      {userEmailColumn: email},
    );

    final newUser = DbUser(id: userId, email: email);

    return newUser;
  }

//get user
  Future<DbUser> getUser({required String email}) async {
    final db = _getDbOrThrowException();

    final result = await db.query(
      userTable,
      where: 'email = ?',
      whereArgs: [email],
    );

    if (result.isEmpty) {
      throw CouldNotGetUser();
    }

    final user = DbUser.fromRow(result.first);

    return user;
  }

//delete user
  Future<int> deleteUser({required String email}) async {
    final db = _getDbOrThrowException();

    int deleted =
        await db.delete(userTable, where: 'email = ?', whereArgs: [email]);

    if (deleted == 0) {
      throw UserNotDeleted();
    }

    return deleted;
  }

//create note
  Future<DbNote> createNote(
      {required DbUser user, required String text}) async {
    _ensureDbIsOpen();
    final db = _getDbOrThrowException();

    final noteId = await db.insert(
      noteTable,
      {
        textColumn: text,
        noteUserIdColumn: user.id,
        isCloudSyncedColumn: 0,
      },
    );

    final newNote = DbNote(
        noteId: noteId, text: text, userId: user.id, isSyncedWithCloud: false);
    _notes.add(newNote);
    notesController.add(_notes);

    return newNote;
  }

//get note
  Future<DbNote> getNote({required int id}) async {
    _ensureDbIsOpen();
    final db = _getDbOrThrowException();

    final result =
        await db.query(noteTable, where: 'note_id = ?', whereArgs: [id]);

    if (result.isEmpty) {
      throw CouldNotGetNote();
    }

    final note = DbNote.fromRow(result.first);
    _notes.add(note);
    notesController.add(_notes);

    return note;
  }

//get all notes
  Future<List<DbNote>> getAllNotes() async {
    _ensureDbIsOpen();
    final db = _getDbOrThrowException();

    final results = await db.query(noteTable);

    if (results.isEmpty) {
      throw CouldNotGetAllNotes();
    }

    final notes = results.map((e) => DbNote.fromRow(e)) as List<DbNote>;

    _notes.clear();
    _notes.addAll(notes);
    notesController.add(_notes);

    return notes;
  }

//update note
  Future<int> updateNote({required int id, required String newText}) async {
    _ensureDbIsOpen();
    final db = _getDbOrThrowException();

    final updated = await db.update(
      noteTable,
      {textColumn: newText},
      where: 'note_id = ?',
      whereArgs: [id],
    );

    if (updated != 1) {
      throw CouldNotUpdateNote();
    }

    return updated;
  }

//delete note
  Future<int> deleteNote({required int id}) async {
    _ensureDbIsOpen();
    final db = _getDbOrThrowException();

    final deleted =
        await db.delete(noteTable, where: 'note_id = ?', whereArgs: [id]);

    if (deleted != 1) {
      throw CouldNotDeleteNote();
    }

    return deleted;
  }
}

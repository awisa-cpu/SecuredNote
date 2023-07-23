import '../utilities/constants/note_service_constants.dart';

class DbNote {
  int noteId;
  String text;
  int userId;
  bool isSyncedWithCloud;

  DbNote(
      {required this.noteId,
      required this.text,
      required this.userId,
      required this.isSyncedWithCloud});

  factory DbNote.fromRow(Map<String, Object?> noteData) => DbNote(
        noteId: noteData[noteIdColumn] as int,
        text: noteData[textColumn] as String,
        userId: noteData[noteUserIdColumn] as int,
        isSyncedWithCloud: (noteData[isCloudSyncedColumn] as int) == 1? true:false,
      );
}

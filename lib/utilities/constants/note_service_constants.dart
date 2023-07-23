const String noteTable = 'Note';
const String userTable = 'User';
const String userIdColumn = 'id';
const String userEmailColumn = 'email';

const String noteIdColumn = 'note_id';
const String textColumn = 'text';
const String noteUserIdColumn = 'user_id';
const String isCloudSyncedColumn = 'is_synced_with_cloud';

const String dbName = 'samsung_note';

const String createNoteTable = """
CREATE TABLE IF NOT EXISTS "Note" (
	"note_id"	INTEGER NOT NULL UNIQUE,
	"text"	TEXT,
	"user_id"	INTEGER,
	"is_synced_with_cloud"	INTEGER,
	PRIMARY KEY("note_id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "User"("id")
);

""";

const String createUserTable = """CREATE TABLE IF NOT EXISTS "User"(
	"email"	TEXT NOT NULL,
	"id"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
""";

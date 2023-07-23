class NoteServiceException implements Exception {}

class DatabaseAlreadyClosed implements Exception {}

class DatabaseNotExist implements Exception {}

class DatabaseCouldNotOpen implements Exception {}

//user
class UserAlreadyExist implements Exception {}

class UserNotDeleted implements Exception {}

class CouldNotGetUser implements Exception {}

//note
class CouldNotGetNote implements Exception {}

class CouldNotGetAllNotes implements Exception {}

class CouldNotUpdateNote implements Exception {}

class CouldNotDeleteNote implements Exception {}

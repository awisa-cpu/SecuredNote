import '../utilities/constants/note_service_constants.dart';

class DbUser {
  int id;
  String email;

  DbUser({required this.id, required this.email});

  factory DbUser.fromRow(Map<String, Object?> userData) => DbUser(
        id: userData[userIdColumn] as int,
        email: userData[userEmailColumn] as String,
      );
}

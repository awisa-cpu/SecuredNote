//login exceptions
class InvalidEmailException implements Exception {}

class UserNotFoundException implements Exception {}

class WrongPasswordException implements Exception {}

class UserDisabledException implements Exception {}

class GenericAuthException implements Exception {}

//register exceptions

class EmailAlreadyInUseException implements Exception {}

class WeakPasswordException implements Exception {}

class OperationNotAllowed implements Exception {}

class CouldNotSendEmailVerificationException implements Exception{}

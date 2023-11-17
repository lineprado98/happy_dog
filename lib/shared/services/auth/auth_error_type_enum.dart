import 'package:firebase_auth/firebase_auth.dart';

enum AuthErrorType { emailAlreadyExists, tokenExpired, unknown, userNotFound, invalidPassword, emailAlreadyInUse, tooManyRequests }

AuthErrorType fromFirebaseException(FirebaseAuthException e) {
  switch (e.code) {
    case 'email-already-in-use':
      return AuthErrorType.emailAlreadyInUse;
    case 'email-already-exists':
      return AuthErrorType.emailAlreadyExists;

    case 'user-not-found':
      return AuthErrorType.userNotFound;

    case 'too-many-requests':
      return AuthErrorType.tooManyRequests;

    case 'invalid-password':
      return AuthErrorType.invalidPassword;

    case 'INVALID_LOGIN_CREDENTIALS':
      return AuthErrorType.invalidPassword;
    default:
      return AuthErrorType.unknown;
  }
}

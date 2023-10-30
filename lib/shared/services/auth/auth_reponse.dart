import 'package:firebase_auth/firebase_auth.dart';

class AuthResponse {
  final dynamic data;
  final bool? success;
  final bool? error;
  final String? message;
  final int? errorCode;
  AuthResponse(
      {this.data, this.error, this.success, this.message, this.errorCode});

  factory AuthResponse.fromSuccess(UserCredential userCredential) {
    return AuthResponse(
        data: userCredential, success: true, error: false, message: null);
  }

  factory AuthResponse.fromError(FirebaseAuthException excpetion) {
    return AuthResponse(
        data: null, success: true, error: false, message: excpetion.message);
  }
}
